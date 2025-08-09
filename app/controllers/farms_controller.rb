class FarmsController < ApplicationController

    def index
        farms = Farm.all

        render json: farms
    end

    def create_farm
        farm = Farms::Create.new(params).execute
        # raw_body = request.raw_post
        # render json: raw_body, status: :ok
        render json: farm
    end


    # def create
    #     order = Orders::Create.new(permitted_params, @current_seller).execute
    #     render json: order, serializer: OrderSerializer, status: :created
    #   end
end
