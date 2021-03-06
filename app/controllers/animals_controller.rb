class AnimalsController < ApplicationController
    def index
        @animal = Animal.all
        render json: @animal
    end
    
    
    def create
        @animal = Animal.create(animal_params)
        render json: @animal
    end
    
    def update
        @animal = Animal.find(params[:id])
        @animal.update(animal_params)
        render json: @animal
    end
    
    def destroy
        @animal = Animal.find(params[:id])
        @animal.destroy
        render json: Animal.all
    end
    
    def show
        @animal = Animal.find(params[:id])
        render json: @animal.to_json({:include => :sightings})
    end
    private
    
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
