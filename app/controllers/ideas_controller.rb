class IdeasController < ActionController::Base

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)
    if @idea.save
      #fix this flash message
      flash[:success] = "You created a new idea!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def index
    @ideas = Idea.all
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "Idea updated!"
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:idea)
  end

end
