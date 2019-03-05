FactoryBot.define do
  factory :invoice, :class => Invoice do
    description { 'Test invoice' }
    amount { 500.0 }
  end
end
