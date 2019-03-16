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

  factory :activity, :class => Activity do
    trait :crossfit_x2 do
      name { 'Crossfit 2 por semana' }
      price { 800 }
    end

    trait :psi do
      name { 'PreparacionFisicaIntegral' }
      price { 500 }
    end
  end
end
