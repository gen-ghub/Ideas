class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @up_idea = Idea.first
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @idea.user.id == current_user.id
    redirect_to root_path
    end
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path
    else
      render :edit
    end
  end

  def destroy
    unless @idea.user.id == current_user.id
      redirect_to root_path
    end
    if @idea.destroy
      redirect_to root_path
    end
  end

  def search
    redirect_to list_ideas_path if params[:keyword] == ""

    split_keyword = params[:keyword].split(/[[:blank:]]+/)

    @ideas = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @ideas += Idea.where('title LIKE(?)', "%#{keyword}%")
    end
    @ideas.uniq!

  end

  def list
    @ideas = Idea.order("created_at DESC").page(params[:page]).per(6)
  end


  private

  def idea_params
    params.require(:idea).permit(:title, :image, :tag_id, :text).merge(user_id: current_user.id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end
end
