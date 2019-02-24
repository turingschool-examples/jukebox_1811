FactoryBot.define do
  factory :playlist, class: Playlist do
    sequence(:name) { |n| "user_#{n}" }
  end
end
