require 'rails_helper'
require 'helpers/authentication_helpers'

RSpec.configure do |c|
  c.include AuthenticationHelpers
end

feature 'Editing tickets' do
  let!(:exp_project) { FactoryBot.create(:project) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:exp_ticket) do
    FactoryBot.create(:ticket, project: exp_project, user: user)
  end

  before do
    sign_in_as!(user)
    visit '/'
    click_link exp_project.name
    click_link exp_ticket.title
    click_link 'Edit Ticket'
  end

  scenario 'Updating a ticket' do
    fill_in 'Title', with: 'Make it really shiny!'
    click_button 'Update Ticket'

    expect(page).to have_content 'Ticket has been updated'

    within('#ticket h2') do
      expect(page).to have_content('Make it really shiny!')
    end

    expect(page).to_not have_content(exp_ticket.title)
  end

  scenario 'Updating a ticket with invalid information' do
    fill_in 'Title', with: ''
    click_button 'Update Ticket'
    expect(page).to have_content('Ticket has not been updated')
  end
end
