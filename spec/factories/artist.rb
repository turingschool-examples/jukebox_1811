FactoryBot.define do
  factory :artist, class: Artist do
    sequence(:name) { |n| "User Name #{n}" }
  end
end
