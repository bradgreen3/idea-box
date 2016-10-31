class IdeasController < ApplicationController
  before_action :authorized_user?

  def authorized_user?
    if params[:user_id].to_i != session[:user_id]
      redirect_to login_path
    end
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "You created a new idea!"
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def edit
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      flash[:success] = "Idea updated!"
      redirect_to user_idea_path(@user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete
    redirect_to user_ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:idea, :user_id, :category_id)
  end

end
