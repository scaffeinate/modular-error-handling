class UsersController < ApplicationController
  def create
    @user = User.create!
    render json: @user if @user.persisted?
  end

  def show
    @user = User.find_by!(id: params[:id])
    respond_to do |format|
      if @user.is_visible?
        format.json { render json: @user, status: :ok }
        format.html
      else
        raise Error::NotVisibleError
      end
    end
  end
end
