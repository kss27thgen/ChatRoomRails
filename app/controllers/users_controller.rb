class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
    else
      render :edit
    end
  end

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :hello)
  end
end
