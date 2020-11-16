class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, idea_id: params[:id])
    redirect_to idea_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, idea_id: params[:id]).destroy
    redirect_to idea_path
  end
end
