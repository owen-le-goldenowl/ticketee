class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update destroy]
  before_action :require_login, except: %i[index show]

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      flash[:notice] = 'Ticket has been created'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Ticket has not been created'
      render 'new'
    end
  end

  def show;
  end

  def edit;
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket has been updated'
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash[:alert] = 'Ticket has not been updated'
      render action: 'edit'
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = 'Ticket has been deleted'
    redirect_to @project
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The ticket you were looking could not be found'
    redirect_to project_path(@project)
  end

  # overwrite this function of Sorcery gem to push a flash to the :require_login
  # https://stackoverflow.com/a/52922147/5441369
  def not_authenticated
    flash[:alert] = 'Please log in first!'
    redirect_to login_path
  end
end
