class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      range = params[:search][:starts_at].match(/^(?<start_date>.{10})\s\w{2}\s(?<end_date>.{10})$/)
      start_date = range[:start_date]
      end_date = range[:end_date]
      @tours = policy_scope(Tour).where('start_date >= ? AND end_date <= ?', start_date, end_date)
    else
      @tours = policy_scope(Tour).order(created_at: :asc)
    end
    @markers = @tours.geocoded.map do |tour|
      {
        lat: tour.latitude,
        lng: tour.longitude,
        info_window: render_to_string(partial: "info_window", locals: { tour: tour })
      }
    end

  end

  def show
    authorize @tour
    @booking = Booking.new
    # set_tour method is responsible to find
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    authorize @tour
    if @tour.save
      redirect_to @tour, notice: 'New tour created!'
    else
      render :new
    end
  end

  def edit
    authorize @tour
  end

  def update
    authorize @tour
    @tour.update(tour_params)
    redirect_to @tour
  end

  def destroy
    authorize @tour
    @tour.destroy
    redirect_to root_path
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:title, :category, :price, :description, :start_date, :end_date, :address, photos: [])
  end

  def search_input
    if params[:query].present?
      sql_query = " \
        tours.title @@ :query \
        OR tours.category @@ :query \
        OR tours.descrption @@ :query \
        OR tours.price @@ :query \
      "
      @tours = Tour.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @tours = Tour.all
    end
  end
end
