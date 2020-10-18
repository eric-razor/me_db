class Api::V1::JobappsController < ApplicationController

    def index 
        @apps = Jobapp.all

        render json: @apps
    end
    
    def show
        @app = @Jobapps.find(params[:id])

        render json: @app
    end
end
