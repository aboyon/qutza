class AddAdditionalUsers < SeedMigration::Migration
  def up
    user = User.create!(:email => 'pablo.saccone@hotmail.com', :name => 'Pablo Saccone', :password => 'password123')
    coach_role = Role.find_by!(:code => 'coach')
    UserRole.create!(:user => user, :role => coach_role)
  end

  def down

  end
end
