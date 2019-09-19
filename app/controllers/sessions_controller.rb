class SessionsController < ApplicationController
  def new;
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
    logout
    redirect_to projects_path
  end

end
