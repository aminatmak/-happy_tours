class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  def index
    @tours = policy_scope(Tour).order(created_at: :asc)
  end

  def show
    authorize @tour
    # set_tour method is responsible to find
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to @tour, notice: 'New tour created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tour.update(tour_params)
    redirect_to @tour
  end

  def destroy
    @tour.destroy
    redirect_to root_path
  end

  private

  def set_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:title, :category, :price, :description, :start_date, :end_date, :user_id)
  end
end
