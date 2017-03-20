require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:all) do
      @user = User.new
      @user.first_name = 'Ronald'
      @user.last_name = 'Newton'
      @user.email = 'ronald@newton.com'
      @user.password = '123456'
    end

    it 'Has all validations' do
      expect(@user).to be_valid
    end

    it 'Password field is blank' do
      @user.password = nil
      expect(@user).to be_invalid
    end

    it 'Password does not match with confirmation' do
      @user.password = '123456'
      @user.password_confirmation = '112345'
      expect(@user).to be_invalid
    end

    it 'Email field is not unique' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.email = 'ronald@newton.com'
      expect(@user).to be_invalid
    end

    it 'Email field is blank' do
      @user.email = nil
      expect(@user).to be_invalid
    end

    it 'First_name field is blank' do
      @user.email = 'some@thing.com'
      @user.first_name = nil
      expect(@user).to be_invalid
    end

    it 'Last_name field is blank' do
      @user.first_name = 'Ronald'
      @user.last_name = nil
      expect(@user).to be_invalid
    end

    it 'Password length is less than required' do
      @user.first_name = 'Ronald'
      @user.last_name = 'Newton'
      @user.email = 'ronald@newton.com'
      @user.password = '1234'
      @user.password_confirmation = '1234'
      expect(@user).to be_invalid
    end
  end

  # describe '.authenticate_with_credentials' do

  # end

end
