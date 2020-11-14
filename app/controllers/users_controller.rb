class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
    @seeds = Seed.where(user_id: @user.id)
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def destroy
    unless @user.id == current_user.id
      redirect_to root_path
    end
    if @user.destroy
      flash[:user_delete] = "アカウントが削除されました"
      redirect_to root_path
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,:image, :email, :encrypted_password, :skill ,:position, :profile)
    end


end
