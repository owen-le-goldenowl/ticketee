class UsersController < ApplicationController
  before_action :set_user, except: %i[new index create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have sign up successfully'
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def show;
  end

  def edit;
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :password,
                                 :password_confirmation,
                                 :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
