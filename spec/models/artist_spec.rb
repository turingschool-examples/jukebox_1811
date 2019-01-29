require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'relationships' do
    it {should have_many :songs} 
  end

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end
