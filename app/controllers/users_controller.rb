class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]

  def require_login
    render file: 'public/404' unless current_admin?

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if params[:id].to_i == session[:user_id]
      @user = User.find(params[:id])
    else
      raise ActionController::RoutingError, 'Logged in as incorrect user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
