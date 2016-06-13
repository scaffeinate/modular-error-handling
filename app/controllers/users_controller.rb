class UsersController < ApplicationController
  def show
    @user = User.find_by!(id: params[:id])
    respond_to do |format|
      format.json { render json: @user, status: :ok }
      format.html
    end
  rescue ActiveRecord::RecordNotFound => e
    respond_to do |format|
      format.json do
        render json: {
          error: e.to_s
        }, status: :not_found
      end
      format.html { redirect_to root_path, flash: { error: e.to_s } }
    end
  end
end
