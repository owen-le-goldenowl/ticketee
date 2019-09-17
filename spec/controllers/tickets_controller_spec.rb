require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  it 'display error for missing ticket' do
    proj = FactoryBot.create(:project)
    user = FactoryBot.create(:user)
    _ticket = FactoryBot.create(:ticket, project: proj, user: user)
    get :show, params: { id: 'not-here', project_id: proj.id }
    expect(response).to redirect_to(project_path(proj))
    message = 'The ticket you were looking could not be found'
    expect(flash[:alert]).to eq(message)
  end
end
