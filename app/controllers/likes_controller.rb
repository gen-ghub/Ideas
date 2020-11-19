class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, idea_id: params[:id])
    @idea = Idea.includes(:likes).find_by(id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, idea_id: params[:id]).destroy
    @idea = Idea.includes(:likes).find_by(id: params[:id])
  end

  private


end
