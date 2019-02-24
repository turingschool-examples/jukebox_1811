require 'rails_helper'

RSpec.describe Cart do
  describe "#total_count" do
    it "can calculate the total number of songs it holds" do
      cart = Cart.new({
        "1" => 2,
        "2" => 3
        })
      expect(cart.total_count).to eq(5)
    end
  end

  describe "#add_song" do
    it "should add a song to our cart" do
      cart = Cart.new({
        "1" => 2,
        "2" => 3
        })

      cart.add_song("1")
      cart.add_song("2")

      expect(cart.contents).to eq({"1" => 3, "2" => 4})
    end
  end
end
