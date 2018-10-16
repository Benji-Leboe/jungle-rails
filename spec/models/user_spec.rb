require 'rails_helper'

RSpec.describe User, type: :model do
  User.transaction(requires_new: true) do
    describe 'Validations' do
      it 'should validate all user fields' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        expect(@user).to be_valid
      end
      it "should have a password of minimum 6 characters" do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'sag', password_confirmation: 'sag')
        expect(@user).to be_valid
      end
      it 'should have password and confirmation' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob')
        expect(@user).to be_valid
      end
      it 'should match password and confirmation' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'soggyboob')
        expect(@user).to be_valid
      end
      it 'should require an email' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", password: 'saggybob', password_confirmation: 'saggybob')
        expect(@user).to be_valid
      end
      it 'should require a unique email' do
        @user1 = User.create!(first_name: "Boob", last_name: "Soget", email: "BOB_SAGET@bobsaget.com", password: 'soggyboob', password_confirmation: 'soggyboob')
        @user2 = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        expect(@user2).to be_valid
      end
      it 'should require first name' do
        @user = User.create!(last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        expect(@user).to be_valid
      end
      it 'should require last name' do
        @user = User.create!(first_name: "Bob", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        expect(@user).to be_valid
      end
    end
  end

  User.transaction(requires_new: true) do
    describe '.authenticate_with_credentials' do
      it 'should authenticate login' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        @auth = User.authenticate_with_credentials(@user.email, @user.password)

        expect(@auth.email).to eql(@user.email)
      end
      it 'should login with whitespace in email' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        @auth = User.authenticate_with_credentials("  bob _saget @ bobsaget.com  ", @user.password)

        expect(@auth.email).to eql(@user.email)
      end
      it 'should login with mixed caps' do
        @user = User.create!(first_name: "Bob", last_name: "Saget", email: "bob_saget@bobsaget.com", password: 'saggybob', password_confirmation: 'saggybob')
        @auth = User.authenticate_with_credentials("BoB_sAgEt@BoBsAgEt.CoM", @user.password)

        expect(@auth.email).to eql(@user.email)
      end
    end
  end

end
