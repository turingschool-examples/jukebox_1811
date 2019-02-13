require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "Validations" do

  end

  describe "Relationships" do
    it {should belong_to :user}
    it {should have_many :order_songs}
    it {should have_many :songs}
  end
end
