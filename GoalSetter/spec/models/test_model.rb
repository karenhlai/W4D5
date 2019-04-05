require 'rails_helper'

RSpec.describe TestModel, type: :model do
  #model's validations, associations, class methods
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    
  end

  describe "class_methods" do
  end