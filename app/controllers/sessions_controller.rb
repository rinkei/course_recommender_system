class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('messages.login')
    else
      @user = User.new(user_params)
      flash.now.alert = t('messages.login_fail')
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: t('messages.logout')
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
