class CreateDefaultActivities < SeedMigration::Migration
  def up
    Activity.create!(:name => 'Crossfit 2 veces por semana', :price => 800.0)
    Activity.create!(:name => 'Crossfit 3 veces por semana', :price => 900.0)
    Activity.create!(:name => 'Crossfit todos los dias', :price => 1050.0)
    Activity.create!(:name => 'Preparacion Fisica Integral', :price => 800.0)
    Activity.create!(:name => 'Brazilian jiu jitsu', :price => 900.0)
    Activity.create!(:name => 'Taekwondo', :price => 800.0)
    Activity.create!(:name => 'Boxeo', :price => 800.0)
    Activity.create!(:name => 'Yoga', :price => 800.0)
  end

  def down
    Activity.delete_all
  end
end
