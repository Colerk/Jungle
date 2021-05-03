require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'should confirm users have a password and password_confirmation field' do
      @user = User.new(name: 'cole', last_name: 'k', email: 'cole.k@test.com', password: nil, password_confirmation: 'test')
      @user.save
      expect(@user.errors.full_messages[0]).to eq "Password can't be blank"
    end

    it 'should confirm users passwords match' do
      @user = User.new(password: 'test', password_confirmation: 'pizza')
      @user.save
      expect(@user.errors.full_messages[0]).to eq "Password confirmation doesn't match Password"
    end

    it 'should confirm user emails are unique' do
      @user1 = User.new(name: 'cole', last_name: 'k', email: 'cole.k@test.com', password: 'test', password_confirmation: 'test')
      @user1.save
      @user2 = User.new(name: 't', last_name: 'k', email: 'cole.k@test.com', password: 'test', password_confirmation: 'test')
      @user2.save
      expect(@user2.errors.full_messages[0]).to eq "Email has already been taken"
    end

    it 'should confirm user passwords have a minimum length' do
      @user = User.new(name: 'cole', last_name: 'k', email: 'cole.k@test.com', password: 't', password_confirmation: 't')
      @user.save
      expect(@user.errors.full_messages[0]).to eq "Password is too short (minimum is 4 characters)"
    end

  end

end
