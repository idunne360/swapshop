require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'test@example.com', password: 'password', password_confirmation: 'password') }
  
  describe 'database_authenticatable' do
    it 'authenticates with correct password' do
      expect(user.valid_password?('password')).to be_truthy
    end

    it 'does not authenticate with incorrect password' do
      expect(user.valid_password?('wrong_password')).to be_falsey
    end
  end

  #needs actual host not localhost
  # describe 'recoverable' do
  #   it 'generates a reset password token' do
  #     user.send_reset_password_instructions
  #     expect(user.reset_password_token).not_to be_nil
  #   end
  # end

  describe 'validatable' do
    it 'validates presence of email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'validates format of email' do
      user.email = 'invalid_email'
      expect(user).not_to be_valid
    end

    it 'validates presence of password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'validates confirmation of password' do
      user.password_confirmation = 'wrong_password'
      expect(user).not_to be_valid
    end
  end
end
