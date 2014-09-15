class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:user][:email], params[:user][:password])
      redirect_to root_path
    else
      @user = User.new(params.require(:user).permit(:email, :password))
      @user.valid?
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_user_session_path
  end
end
