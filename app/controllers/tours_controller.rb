class ToursController < ApplicationController
  before_action :set_tour, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(list_params)
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
    @tour = Tour.find(params[:id])
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
