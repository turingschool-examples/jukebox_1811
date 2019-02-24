class Order < ApplicationRecord
  belongs_to :user
  has_many :order_songs
  has_many :songs, through: :order_songs
end
