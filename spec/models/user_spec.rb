require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'user validates' do 
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })
      expect(user).to be_valid
    end

    it 'user pasword match validation' do 
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "124"
      })
      expect(user).to_not be_valid
      puts "Error message: #{user.errors.full_messages}"
    end

    it 'user pasword length validation' do 
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "12",
        password_confirmation: "12"
      })
      expect(user).to_not be_valid
      puts "Error message: #{user.errors.full_messages}"
    end

    it 'user email case sensitive validation' do 
      user = User.create({
      email: "Test@mail.com",
      first_name: "John",
      last_name: "Doe",
      password: "123",
      password_confirmation: "123"
      })
      user.save

      user1 = User.create({
        email: "TesT@mail.com",
        first_name: "James",
        last_name: "John",
        password: "123",
        password_confirmation: "123"
      })
      user1.save

      expect(User.find_by(email: "Test@mail.com")).not_to be_nil
      expect(user1.valid?).to be(false)
      puts "Error message: #{user1.errors.full_messages}"
      
    end

    it 'email cannot be blank' do
      user = User.create({
        email: nil,
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })

      expect(user).to_not be_valid
      puts "Error message: #{user.errors.full_messages}"
    end

    it 'first name cannot be blank' do
      user = User.create({
        email: "test@mail.com",
        first_name: nil,
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })

      expect(user).to_not be_valid
      puts "Error message: #{user.errors.full_messages}"
    end

    it 'last name cannot be blank' do
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: nil,
        password: "123",
        password_confirmation: "123"
      })

      expect(user).to_not be_valid
      puts "Error message: #{user.errors.full_messages}"
    end

  end

  describe '.authenticate_with_credentials' do
    it 'validate user credentials' do
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })
      expect(User.authenticate_with_credentials("test@mail.com", "123")).to eql user
    end

    it 'validate user credentials with upper case email' do
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })
      expect(User.authenticate_with_credentials("tEst@mAiL.COm", "123")).to eql user
    end

    it 'validate user credentials with spaces before and after email' do
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })
      expect(User.authenticate_with_credentials(" test@mail.com    ", "123")).to eql user
    end

    it 'invalidate user credentials with wrong password' do
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })
      expect(User.authenticate_with_credentials("test@mail.com", "IcpXoInBWP")).to be_nil
    end

    it 'invalidate user credentials with wrong email' do
      user = User.create({
        email: "test@mail.com",
        first_name: "John",
        last_name: "Doe",
        password: "123",
        password_confirmation: "123"
      })
      expect(User.authenticate_with_credentials("jack@mail.com", "123")).to be_nil
    end
  end

end
