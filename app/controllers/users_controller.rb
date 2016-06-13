class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    respond_to do |format|
      if @user
        format.json { render json: @user, status: :ok }
        format.html { redirect_to @user }
      else
        format.json {
          render json: {
            error: "User with id #{params[:id} not found."
          }, status: :not_found
        }
        format.html { redirect_to root_path, flash: { error: "User with id #{params[:id} not found." } }
      end
    end
  end
end
