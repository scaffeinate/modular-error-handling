class UsersController < ApplicationController
  def show
    @user = User.find_by!(id: params[:id])
    raise Error::NotVisibleError unless @user.is_visible?
    render json: @user, status: :ok
  end
end
