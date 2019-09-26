module TicketsHelper
  def toggle_watching_button
    text = if @ticket.watchers.include?(current_user)
             'Stop watching this ticket'
           else
             'Watch this ticket'
           end
    button_to text, watch_project_ticket_path(@ticket.project, @ticket)
  end
end
