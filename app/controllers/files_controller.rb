class FilesController < ApplicationController
  before_action :require_login

  def show
    asset_record = Asset.find(params[:id])
    if authorize asset_record.ticket.project, policy_class: ProjectPolicy
      send_file asset_record.asset.path,
                type: asset_record.asset.content_type,
                filename: asset_record.asset.file.filename,
                disposition: 'inline'
      # redirect_back fallback_location: asset_record.ticket
    else
      flash[:alert] = 'The asset you were looking for could not be found'
      redirect_to root_path
    end

  end
end
