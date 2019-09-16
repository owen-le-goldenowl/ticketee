class ErrorsController < ApplicationController
  def not_found
    render_404
  end

  private

  def render_404
    render file: "#{Rails.root}/public/404", status: 404
  end
end
