class AuthController < ApplicationController
  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_jwt({ user_id: user.id })
      render json: { token: token, user: user }, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # POST /logout
  def logout
    # Para JWT, o logout é feito no client (basta descartar o token)
    # Opcional: implementar blacklist de tokens se necessário
    render json: { message: 'Logged out successfully' }, status: :ok
  end
end 