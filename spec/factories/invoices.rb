FactoryBot.define do
  factory :invoice, :class => Invoice do
    description { 'Test invoice' }
    amount { 500.0 }

    trait :paid do
      status { Invoice::STATUS[:paid] }
    end
  end

  factory :discount, :class => Discount do
    name { 'Test Discount' }
    trait :percentage do
      discount_type { Discount::TYPE[:percentage] }
      value { 50.0 }
    end

    trait :amount do
      discount_type { Discount::TYPE[:amount] }
      value { 10.0 }
    end
  end

  factory :invoice_discount, :class => InvoiceDiscount do
    association :invoice, :factory => :invoice
    association :discount, :factory => :discount
  end
end
