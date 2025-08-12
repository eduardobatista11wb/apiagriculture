class FarmsController < ApplicationController
    before_action :authenticate_request!, only: [:index]

    def index
        farms = Farm.all
        render json: farms, each_serializer: FarmSerializer
    end

    def index_by_user
        farms = Farm.where(user_id: params[:id])
        render json: farms, each_serializer: FarmSerializer
    end

    def show
        farm = Farm.find(params[:id])
        if farm
            render json: farm, serializer: FarmSerializer
        else
            render json: { error: "Farm not found" }, status: :not_found
        end
    end

    def create_farm
        farm = Farms::Create.new(params).execute

        if farm.is_a?(Farm)
          render json: farm, serializer: FarmSerializer, status: :created
        else
          render json: farm, status: :unprocessable_entity
        end
    end


    # def create
    #     order = Orders::Create.new(permitted_params, @current_seller).execute
    #     render json: order, serializer: OrderSerializer, status: :created
    #   end
end
