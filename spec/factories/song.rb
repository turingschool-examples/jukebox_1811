FactoryBot.define do
  factory :song do
    artist
    sequence(:title) { |n| "Item Name #{n}" }
    length { 180 }
    play_count { 1_000_000 }
  end
end
