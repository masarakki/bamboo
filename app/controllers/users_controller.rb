class UsersController < ApplicationController
  def update
    current_user.update(user_params)
    redirect_to :root
  end

  protected

  def user_params
    params.require(:user).permit(:vote_id)
  end
end
