require 'rails_helper'
feature 'Deleting projects' do
  scenario 'deleting a project' do
    FactoryBot.create(:project, name: 'TextMate 2')
    visit '/'
    click_link 'TextMate 2'
    click_link 'Delete project'
    expect(page).to have_content('Project has been destroyed')
    visit '/'
    expect(page).to have_no_content 'TextMate 2'
  end
end
