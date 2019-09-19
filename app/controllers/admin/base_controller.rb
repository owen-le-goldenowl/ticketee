class Admin::BaseController < ApplicationController
  before_action :require_login
  def index; end
end
