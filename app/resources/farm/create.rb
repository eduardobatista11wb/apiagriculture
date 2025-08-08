class Farms::Create
    attr_accessor :params

    def initialize(params)
      @params = params
    end
  
    def execute
        params
    #   user = User.new(params)
    #   user
        # raw_body = request.raw_post
        # render json: raw_body, status: :ok
    end

    def mount_params
        {
          code: params[:code],
          products: params[:products],
          seller: seller,
          buyer: buyer,
          invoice_id: params[:invoice_id]
        }
    end

  end
  