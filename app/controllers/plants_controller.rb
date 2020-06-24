class PlantsController < ApplicationController
  def create
    #Initialize a new plant with the params given by the form
    @plant = Plant.new(plant_params)
    #The plant needs a garden
    #Let's find it
    @garden = Garden.find(params[:garden_id])
    #Connect plant and garden
    @plant.garden = @garden
    @plants = @garden.plants
    if @plant.save
      redirect_to garden_path(@garden)
      flash[:success] = "Great! The plant Has been Created!"
    else
      flash[:alert] = "Ops, something Went Wrong!"
      render 'gardens/show'
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    flash[:success] = "Great! The plant Has been destroyed!"
    redirect_to garden_path(@plant.garden)
  end

  def show
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
