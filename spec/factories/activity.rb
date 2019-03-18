FactoryBot.define do

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
