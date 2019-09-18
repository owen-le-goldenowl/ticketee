class SessionsController < ApplicationController
  def new;
  end

  def create
    @user = login(params['/login']['name'], params['/login']['password'])
    if @user
      flash[:notice] = 'Log in success'
      redirect_to projects_path
    else
      flash[:error] = 'Name and Password combination does not match!'
      render 'new'
    end

  end

  def destroy
  end

end
