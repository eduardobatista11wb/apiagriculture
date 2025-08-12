class Farms::Create
    attr_accessor :params

    def initialize(params)
      @params = params
    end
  
    def execute
      farm = Farm.new(mount_params.merge(user_id: params[:id])) # Ajuste se `user_id` vier de outro lugar
      if farm.save
        farm # retorna o objeto para o serializer
      else
        # pode retornar erros, mas nesse caso não dá para usar o serializer normal
        { errors: farm.errors.full_messages }
      end
      # user = User.new(params)
      # user.save
      # raw_body = request.raw_post
      # render json: raw_body, status: :ok
    end

    def mount_params
        {
          name: params[:name],
          country: params[:country],
          state: params[:state],
          city: params[:city],
          address: params[:address],
          zip_code: params[:zipcode]
        }
    end

    private

    def farm_params
      @params.require(:farm).permit(:name, :country, :state, :city, :address, :zipcode)
    end

  end
  