class ApplicationController < ActionController::API
  private

  def authenticate_request!
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = decode_jwt(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end

  def encode_jwt(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.credentials[:secret_key_base])
  end

  def decode_jwt(token)
    decoded = JWT.decode(token, Rails.application.credentials[:secret_key_base])[0]
    HashWithIndifferentAccess.new decoded
  end
end
