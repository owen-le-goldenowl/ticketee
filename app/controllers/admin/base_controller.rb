class Admin::BaseController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def index

  end

  private

  def require_admin
    unless current_user.admin?
      flash[:error] = 'You must be admin to go there!'
      redirect_back(fallback_location: root_path)
    end
  end
end
