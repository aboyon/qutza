FactoryBot.define do
  factory :user, :class => User do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:email) { |n| "email+#{n}@server.com" }
    password { 'password12!!' }

    trait :admin do
      after(:create) do |factory, e|
        factory.roles << build(:role, :admin)
      end
    end
  end
end
