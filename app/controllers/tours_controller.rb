class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      if params[:search][:starts_at].present? && !params[:search][:category].present?
        range = search_input(params[:search][:starts_at])
        @tours = policy_scope(Tour).where('start_date >= ? AND end_date <= ?', range.first, range.last)
      elsif !params[:search][:starts_at].present? && params[:search][:category].present?
        @tours = policy_scope(Tour).where(category: params[:search][:category])
      elsif params[:search][:starts_at].present? && params[:search][:category].present?
        @tours = policy_scope(Tour).where(category: params[:search][:category])

        ##########################################################################
        range = search_input(params[:search][:starts_at])
        ####################################################################################

        @tours = @tours.where('start_date >= ? AND end_date <= ?', range.first, range.last)
      else
        @tours = policy_scope(Tour).order(created_at: :asc)
      end
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

  def search_input(params)
    range = params.match(/^(?<start_date>.{10})\s\w{2}\s(?<end_date>.{10})$/)
    start_date = range[:start_date]
    end_date = range[:end_date]
    [start_date, end_date]
  end
end
