require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a new user if all fields are complete' do
      @user = User.create({
        first_name: "Minnie",
        last_name: "Mouse",
        email: "minnie@me.me",
        password: "123456",
        password_confirmation: "123456"
      })
      expect(@user.id).to be_present
    end

    it 'should not create a new user if passwords do not match' do
      @user = User.create({
        first_name: "Minnie",
        last_name: "Mouse",
        email: "minnie@me.me",
        password: "123456",
        password_confirmation: "654321"
      })
      expect(@user.id).to be_nil
    end

    it 'should not create a new user if no first name present' do
      @user = User.create({
        last_name: "Mouse",
        email: "minnie@me.me",
        password: "123456",
        password_confirmation: "123456"
      })
      expect(@user.id).to be_nil
    end

    it 'should not create a new user if no last name present' do
      @user = User.create({
        first_name: "Mickey",
        email: "minnie@me.me",
        password: "123456",
        password_confirmation: "123456"
      })
      expect(@user.id).to be_nil
    end

    it 'should not create a new user if no email present' do
      @user = User.create({
        first_name: "Mickey",
        last_name: "Mouse",
        password: "123456",
        password_confirmation: "123456"
      })
      expect(@user.id).to be_nil
    end

    it 'should not create a new user if password is less than 6 characters' do
      @user = User.create({
        last_name: "Mouse",
        email: "minnie@me.me",
        password: "123",
        password_confirmation: "123"
      })
      expect(@user.id).to be_nil
    end

    it 'should not create a user if email address already exists in database' do
      @user1 = User.create({
        first_name: "Mickey",
        last_name: "Mouse",
        email: "minnie@me.me",
        password: "123456",
        password_confirmation: "123456"
      })
      @user2 = User.create({
        first_name: "Donald",
        last_name: "Duck",
        email: "MINNIE@ME.ME",
        password: "123456",
        password_confirmation: "123456"
      })
      expect(@user2.id).to be_nil
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should create a user' do
      @user = User.create({
        first_name: "Minnie",
        last_name: "Mouse",
        email: "minnie@me.me",
        password: "123456",
        password_confirmation: "123456"
      })
      user = User.authenticate_with_credentials(:email => "minnie@me.me", :password => "123456")
      expect(user).to be_present
    end
    it 'should allow a user to log in if there are spaces around their email address' do
      @user = User.create({
        first_name: "Minnie",
        last_name: "Mouse",
        email: "minnie@me.me" ,
        password: "123456",
        password_confirmation: "123456"
      })
      user = User.authenticate_with_credentials(:email => " minnie@me.me ", :password => "123456")
      expect(user).to be_present
    end
  end
end
