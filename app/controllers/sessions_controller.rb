class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:error] = 'Please log out first!'
      redirect_to(request.referer || root_path)
    end
  end

  def create
    @user = login(params['/login']['name'], params['/login']['password'])
    if @user
      flash[:notice] = 'Log in success'
      redirect_to projects_path
    else
      flash[:error] = 'Invalid credentials!'
      render 'new'
    end

  end

  def destroy
    if !logged_in?
      flash[:error]='You are not logged in'
      redirect_to root_path
    else
      logout
      redirect_to projects_path
    end
  end

end
