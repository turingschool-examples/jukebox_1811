require 'rails_helper'

RSpec.describe 'categories workflow' do
  context 'as an admin user' do
    it 'allows admin to see all categories' do
      user = User.create!(username: 'papa smurf', password: 'password', role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to have_content('Admin Categories')
    end
  end
  context 'as a regular user' do
    it 'should not see the admin categories page' do
      user = User.create!(username: 'fuzzyduck', password: 'password', role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to_not have_content('Admin Categories')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
