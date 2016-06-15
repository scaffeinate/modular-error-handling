class UsersController < ApplicationController
  def create
    @user = User.create!
    @user.persisted? if render json: @user
  end

  def show
    @user = User.find_by!(id: params[:id])
    respond_to do |format|
      if @user.is_visible?
        format.json { render json: @user, status: :ok }
        format.html
      else
        fail Error::NotVisibleError
      end
    end
  end
end
