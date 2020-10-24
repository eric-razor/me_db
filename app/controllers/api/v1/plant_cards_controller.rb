class PlantCardsController < ApplicationController

   def index 
        @plant_cards = PlantCard.all

        render json: @plant_cards
    end
    
    def show
        @pc = PlantCard.find(params[:id])

        render json: @pc
    end
end
