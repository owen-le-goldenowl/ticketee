require 'rails_helper'
feature 'Deleting tickets' do
  let!(:example_project) { FactoryBot.create(:project) }
  let!(:example_ticket) { FactoryBot.create(:ticket, project: example_project) }

  before do
    visit '/'
    click_link example_project.name
    click_link example_ticket.title
  end

  scenario 'Deleting a ticket' do
    click_link 'Delete Ticket'
    expect(page).to have_content('Ticket has been deleted')
    expect(page.current_url).to eq(project_url(example_project))
  end
end
