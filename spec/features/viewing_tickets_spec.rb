# frozen_string_literal: true

require 'rails_helper'
feature 'Viewing tickets' do
  before do
    textmate_2 = FactoryBot.create(:project, name: 'TextMate 2')
    FactoryBot.create(:ticket,
                      project: textmate_2,
                      title: 'Make it shiny!',
                      description: 'Gradients! Starbursts! Oh my!')

    internet_explorer = FactoryBot.create(:project, name: 'internet Explorer')
    FactoryBot.create(:ticket,
                      project: internet_explorer,
                      title: 'Standards compliance',
                      description: "Isn't a joke")

    visit '/'
  end

  scenario 'Viewing tickets for a given project' do
    click_link 'TextMate 2'

    expect(page).to have_content('Make it shiny!')
    expect(page).to_not have_content('Standard compliance')

    click_link 'Make it shiny!'
    within('#ticket h2') do
      expect(page).to have_content('Make it shiny!')
    end

    expect(page).to have_content('Gradients! Starbursts! Oh my!')
  end
end
