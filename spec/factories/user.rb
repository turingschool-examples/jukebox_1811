FactoryBot.define do
  factory :user, class: User do
    sequence(:username) { |n| "user_#{n}" }
    sequence(:password) { "password" }
    role { 0 }
  end
  factory :admin, parent: :user do
    sequence(:username) { |n| "admin_#{n}" }
    role { 1 }
  end
end
