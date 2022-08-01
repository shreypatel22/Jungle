require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # Blank Input Tests ----------------------------------------------
    it "should not save without a password" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: nil,
        password_confirmation: "testtest"
      )

      @user.save
      expect(@user).not_to be_valid  
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not save without a password confirmation" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: nil
      )

      @user.save   
      expect(@user).not_to be_valid   
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "should not save without a first name" do     
      @user = User.new(
        first_name: nil,
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: "testtest"
      )

      @user.save    
      expect(@user).not_to be_valid  
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should not save without a last name" do     
      @user = User.new(
        first_name: 'bob',
        last_name: nil,
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: "testtest"
      )

      @user.save    
      expect(@user).not_to be_valid  
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should not save without a email" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: nil,
        password: "testtest",
        password_confirmation: "testtest"
      )

      @user.save    
      expect(@user).not_to be_valid  
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    # Password Tests ----------------------------------------------
    it "should not save when password doesnt match password confirmation" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: "test"
      )

      @user.save
      expect(@user).not_to be_valid  
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should not save when password is less than 8 characters" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtes",
        password_confirmation: "testtes"
      )

      @user.save
      expect(@user).not_to be_valid  
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

    # Email Tests ----------------------------------------------
    it "emails should be unique" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: "testtest"
      )
      @user.save

      @user2 = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: "testtest"
      )
      @user2.save
      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "emails should be unique and not case sensitive" do     
      @user = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'bob@gmail.com',
        password: "testtest",
        password_confirmation: "testtest"
      )
      @user.save

      @user2 = User.new(
        first_name: 'bob',
        last_name: 'bobby',
        email: 'Bob@gmail.com',
        password: "testtest",
        password_confirmation: "testtest"
      )
      @user2.save
      expect(@user2).not_to be_valid  
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end
end
