class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update destroy]
  # before_action :require_login, except: %i[index show]

  def new
    @ticket = @project.tickets.build
    authorize @ticket
  end

  def create
    @ticket = @project.tickets.build(ticket_params)

    authorize @ticket

    @ticket.user = current_user
    if @ticket.save
      flash[:notice] = 'Ticket has been created'
      redirect_to [@project, @ticket]
    else
      flash[:alert] = 'Ticket has not been created'
      render 'new'
    end
  end

  def show
    authorize @ticket
    @comment = @ticket.comments.build
    @states = State.all
  end

  def edit
    authorize @ticket
  end

  def update
    authorize @ticket

    if @ticket.update(ticket_params)
      flash[:notice] = 'Ticket has been updated'
      redirect_to project_ticket_path(@project, @ticket)
    else
      flash[:alert] = 'Ticket has not been updated'
      render action: 'edit'
    end
  end

  def destroy
    authorize @ticket

    @ticket.destroy
    flash[:notice] = 'Ticket has been deleted'
    redirect_to @project
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, assets: [])
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

end
