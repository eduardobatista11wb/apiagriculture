class FarmsController < ApplicationController

    def create_farm
        farm = Farms::Create.new(params).execute
        # raw_body = request.raw_post
        # render json: raw_body, status: :ok
        farm
    end


    # def create
    #     order = Orders::Create.new(permitted_params, @current_seller).execute
    #     render json: order, serializer: OrderSerializer, status: :created
    #   end
end
