class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.password == user_params[:password]
      cookies.encrypted.signed[:user_id] = user.id
      redirect_to articles_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
