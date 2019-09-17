require 'rails_helper'
describe User, type: :model do
  it 'needs a password and confirmation to save' do
    u = User.new(name: 'Khang')
    u.save
    expect(u).to_not be_valid

    u.password = 'password'
    u.password_confirmation = ''
    u.save
    expect(u).to_not be_valid

    u.password_confirmation = 'password'
    u.save
    expect(u).to be_valid
  end

  it 'needs a password and confirmation to match' do
    u = User.new(
        name: 'Khang',
        password: 'hunter2',
        password_confirmation: 'hunter')
    expect(u).to_not be_valid
  end

  describe 'authentication' do
    let(:user) do
      User.create(
          name: 'khang',
          password: 'hunter2',
          password_confirmation: 'hunter2'
      )
    end

    it 'authenticate with a correct password' do
      expect(user.authenticate('hunter2')).to be
    end

    it 'does not authenticate with a incorrect password' do
      expect(user.authenticate('hunter1')).to_not be
    end

  end
end


