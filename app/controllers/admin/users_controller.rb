class Admin::UsersController < ApplicationController
  before_action :require_login

  def index
    authorize [:admin, current_user]
  end


end
