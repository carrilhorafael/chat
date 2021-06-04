class AuthController < ApplicationController
  def login
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      token = JsonWebToken.encode({user_id: @user.id})

      render json: {token: token, user: @user}
    else
      render json: {errors: "Não autenticado"}, status: 401
    end
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end
end
