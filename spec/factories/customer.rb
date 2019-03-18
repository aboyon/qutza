FactoryBot.define do
  factory :customer, :class => Customer do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:email) { |n| "email+#{n}@server.com" }
    sequence(:person_identifable_nbr) { |n| "PID#{n}" }
    joined_at { Date.today - 1.month }
    active { true }

    trait :inactive do
      active { false }
    end

    trait :crossfiter_x2 do
      after(:create) do |crossfiter, factory|
        crossfiter.activities << build(:activity, :crossfit_x2)
      end
    end
  end

  factory :customer_access, :class => CustomerAccess do
    association :customer, :factory => :customer
  end
end
