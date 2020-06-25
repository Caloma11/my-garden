class PlantTagsController < ApplicationController

  def new
    @plant_tag = PlantTag.new # Empty plant_tag instance
    @plant = Plant.find(params[:plant_id]) # Plant to be associated
  end

  def create
    tag_ids = plant_tag_params[:plant_tag][:tag] #Array of tag_id`s
    plant_id = params[:plant_id]

    # my_tag = Tag.find(tag_id) # An instance of tag
    @plant = Plant.find(plant_id) # An instance of plant


    tag_ids.each do |tag_id|
      my_new_plant_tag = PlantTag.new(tag_id: tag_id, plant: @plant)
      my_new_plant_tag.save
    end


    redirect_to garden_path(@plant.garden)



    # new_plant_tag = PlantTag.new(plant_id: plant_id, tag_id: tag_id) # A relationship between a plant and a tag
    # if new_plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   @plant_tag = PlantTag.new
    #   render :new
    # end

  end

  def plant_tag_params
    params.permit(:plant_id, plant_tag: {})
  end

end
