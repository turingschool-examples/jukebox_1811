require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valdiations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :username }
  end
end
