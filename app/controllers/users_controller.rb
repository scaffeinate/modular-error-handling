class UsersController < ApplicationController
  def show
    @user = User.find_by!(id: params[:id])
    respond_to do |format|
      format.json { render json: @user, status: :ok }
      format.html
    end
  end
end
