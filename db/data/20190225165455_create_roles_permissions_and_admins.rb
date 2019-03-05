class CreateRolesPermissionsAndAdmins < SeedMigration::Migration
  def up
    # Permissions
    add_customer = Permission.create!(:code => 'add_customer', :name => "Crear nuevos clientes")
    deactivate_customer = Permission.create!(:code => 'deactivate_customer', :name => "Desactivar clientes")
    create_activity = Permission.create!(:code => 'create_activity', :name => "Crear nueva actividad")
    deactive_activity = Permission.create!(:code => 'deactive_activity', :name => "Desactivar actividad")
    add_price = Permission.create!(:code => 'add_price', :name => "Agregar nuevo precio a actividad")
    add_payment = Permission.create!(:code => 'add_payment', :name => "Agregar nuevo pago")

    # Roles
    admin_role = Role.create!(:code => 'admin', :name => 'Administrador')
    coach_role = Role.create!(:code => 'coach', :name => 'Profesor / Coach')
    community_manager_role = Role.create!(:code => 'community_manager', :name => 'Community Manager ')

    # Role's permissions
    RolePermission.create!(:role => admin_role, :permission => add_customer)
    RolePermission.create!(:role => admin_role, :permission => deactivate_customer)
    RolePermission.create!(:role => admin_role, :permission => deactive_activity)
    RolePermission.create!(:role => admin_role, :permission => add_price)
    RolePermission.create!(:role => admin_role, :permission => add_payment)

    RolePermission.create!(:role => coach_role, :permission => add_payment)

    # Users
    admin1 = User.create!(:email => 'jdsilveira@gmail.com', :name => 'David Silveira', :password => '!P4ssw0rd1.')
    admin2 = User.create!(:email => 'admin1@quetzacoatlbox.com', :name => 'Ale Panzeri', :password => '!P4ssw0rd2.')
    coach1 = User.create!(:email => 'coach-pablo@quetzacoatlbox.com', :name => 'Pablo S.', :password => '!P4ssw0rd3.')
    coach2 = User.create!(:email => 'coach-agus@quetzacoatlbox.com', :name => 'Agustin P.', :password => '!P4ssw0rd4.')
    coach3 = User.create!(:email => 'coach-vicky@quetzacoatlbox.com', :name => 'Vicky L.', :password => '!P4ssw0rd5.')

    # Role assignment
    UserRole.create!(:user => admin1, :role => admin_role)
    UserRole.create!(:user => admin2, :role => admin_role)
    UserRole.create!(:user => coach1, :role => coach_role)
    UserRole.create!(:user => coach2, :role => coach_role)
    UserRole.create!(:user => coach3, :role => coach_role)
  end

  def down

  end
end
