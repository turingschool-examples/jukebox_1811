require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :username }
  end

  describe 'roles' do
    it 'can create and test an admin user' do
      user = User.create(username: 'papa smurf', password: 'password', role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to eq(true)
      expect(user.default?).to eq(false)
    end
    it 'can create and test an regular user' do
      user = User.create(username: 'fuzzyduck', password: 'password', role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to eq(true)
      expect(user.admin?).to eq(false)
    end
  end
end
