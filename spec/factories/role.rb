FactoryBot.define do
  factory :role, :class => Role do
    trait :admin do
      code { 'admin' }
      name { 'Administrator' }
    end
  end

  factory :permission, :class => Permission do
    trait :access_all do
      code { 'access_all' }
      name { 'access_all' }
    end
  end

  factory :role_permission, :class => RolePermission do
    trait :admin do
      permission { create(:permission, :access_all) }
      role { create(:role, :admin) }
    end
  end
end
