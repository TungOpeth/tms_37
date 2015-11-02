class UsersController < ApplicationController
  load_and_authorize_resource
  def show
  end

  def new
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t :user_deleted
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :password,
                                   :password_confirmation
    end
end
