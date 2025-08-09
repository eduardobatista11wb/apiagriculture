class Farms::Create
    attr_accessor :params

    def initialize(params)
      @params = params
    end
  
    def execute
      farm = Farm.new(mount_params.merge(user_id: params[:id]))
      if farm.save
        farm
      else
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

  end
  