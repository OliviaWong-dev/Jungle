require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'validate all fields are required' do
      @user = User.new(
        first_name: "first_name",
        last_name: "last_name",
        email: "test@test.com",
        password: "hello",
        password_confirmation: "hello"
      )
      expect(@user).to be_valid
    end

    it 'password and confirmed password are the same' do
      @user = User.new
      @user.password = "hello"
      @user.password_confirmation = "hello"
      expect(@user.password).to eq(@user.password_confirmation)
      @user.password = "hello"
      @user.password_confirmation = "bello"
      expect(@user.password).to_not eq(@user.password_confirmation)
    end

    it 'check emails are unique' do 
      @user = User.new
      @user.email = "test@test.com"
      @user.save
      @user2 = User.new
      @user2.email = "test@test.com"
      @user2.save
      expect(@user2).to be_invalid
    end

    it 'password must be a minimum length when a user account is being crated' do
      @user = User.new(
        first_name: "first_name",
        last_name: "last_name",
        email: "test@test.com",
        password: "hello",
        password_confirmation: "hello"
      )
      expect(@user).to be_valid
      @user = User.new(
        first_name: "first_name",
        last_name: "last_name",
        email: "test@test.com",
        password: "hello",
        password_confirmation: "he"
      )
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate password' do
      @user = User.new(
        first_name: "first_name",
        last_name: "last_name",
        email: "test@test.com",
        password: "hello",
        password_confirmation: "hello"
      )
      @user.save
      @user = User.authenticate_with_credentials('test@test.com', "hello")
      expect(@user).not_to be(nil)
    end

    it 'should authenticate with extra spaces before or after email' do
      @user = User.new(
        first_name: "first_name",
        last_name: "last_name",
        email: "test@test.com",
        password: "hello",
        password_confirmation: "hello"
      )
      @user.save
      @user = User.authenticate_with_credentials(' test@test.com  ', "hello")
    end

    it 'should authenticate with wrong email letter cases' do
      @user = User.new(
        first_name: "first_name",
        last_name: "last_name",
        email: "test@test.com",
        password: "hello",
        password_confirmation: "hello"
      )
      @user.save
      @user = User.authenticate_with_credentials('TeST@TesT.com', "hello")
    end
  end
end
