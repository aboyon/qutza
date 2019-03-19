class AddDiscounts < SeedMigration::Migration
  def up
    Discount.create!(:name => 'Proporcional PSI', :value => 50.0, :discount_type => Discount::TYPE[:percentage])
  end

  def down

  end
end
