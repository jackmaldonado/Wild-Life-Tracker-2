class SightingsController < ApplicationController
    
    def create
        @sighting = Sighting.create(sighting_params)
        render json: @sighting
    end
    
    def update 
        @sighting = Sighting.find(params[:id])
        @sighting.update
        render json: @sighting
    end
    
    def destroy
        @sighting = Sighting.find(params[:id])
        @sighting.destroy
        render json: @sighting
    end
    
    def show
        @sighting = Sighting.show(sighting_params)
        render json: @sighting
    end
    
    
    
    private
    
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :long, :lat)
    end
end