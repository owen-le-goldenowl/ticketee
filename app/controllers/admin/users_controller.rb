class Admin::UsersController < Admin::BaseController

  def index
    authorize [:admin, current_user]
    @users = User.order(:email)
  end

  def new
    @user = User.new
    authorize [:admin, @user]
  end

  def create
    params = user_params.dup
    params[:password_confirmation] = params[:password]
    @user = User.new(params)

    authorize [:admin, current_user]

    if @user.save
      flash[:notice] = 'User has been created'
      redirect_to admin_users_path
    else
      flash[:alert] = 'User has not been created'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
