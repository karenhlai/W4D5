require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create!(username: 'Anthony', password: 'hunter12')
  subject(:user)
  #model's validations, associations, class methods
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
  
  describe "associations" do
    
  end
  
  
  describe "password encryption" do
    it 'does not save passwords to database' do
      user = User.find_by(username: 'Anthony')
      expect(user.password).not_to be('hunter12')
    end

    it 'password is encrypted by BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('hunter12')
      User.new(username: 'Anthony', password:'hunter12')
    end 
  end

  describe "finding user by credentials" do
    it "returns user's username" do
      expect(User.find_by(user.username)).not_to be_nil
    end
  end
end