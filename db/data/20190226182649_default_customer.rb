class DefaultCustomer < SeedMigration::Migration
  def up
    user = User.find_by(:email => 'jdsilveira@gmail.com')
    customer = Customer.create!(
      :name => 'David Silveira',
      :user => user,
      :email => user.email,
      :person_identifable_nbr => '11222333',
      :joined_at => DateTime.now - 3.years
    )
    pfi = Activity.find_by(:name => 'Preparacion Fisica Integral')
    customer_activity = CustomerActivity.create!(:customer => customer, :activity => pfi, :amount => 500.0)
    CustomerAccess.create!(:customer => customer, :timestamp => DateTime.now - 2.days)
    CustomerAccess.create!(:customer => customer, :timestamp => DateTime.now - 1.day)
    CustomerAccess.create!(:customer => customer, :timestamp => DateTime.now)

    nov2018 = Invoice.create!(
      :customer => customer,
      :amount => customer_activity.amount,
      :status => 'paid',
      :amount_paid => customer_activity.amount,
      :payment_receipt => 'PMNTREC01',
      :description => customer_activity.activity.name
    )
    nov18_created_at = DateTime.now - 3.months
    nov2018.update_columns(:created_at => nov18_created_at, :due_date => (nov18_created_at.next_month.at_beginning_of_month + 10.days))

    dec2018 = Invoice.create!(
      :customer => customer,
      :amount => customer_activity.amount,
      :status => 'paid',
      :amount_paid => customer_activity.amount,
      :payment_receipt => 'PMNTREC43',
      :description => customer_activity.activity.name
    )
    dec18_created_at = DateTime.now - 2.months
    dec2018.update_columns(:created_at => dec18_created_at, :due_date => (dec18_created_at.next_month.at_beginning_of_month + 10.days))

    jan2019 = Invoice.create!(
      :customer => customer,
      :amount => customer_activity.amount,
      :status => 'paid',
      :amount_paid => customer_activity.amount,
      :payment_receipt => 'PMNTREC87',
      :description => customer_activity.activity.name
    )
    jan18_created_at = DateTime.now - 1.months
    jan2019.update_columns(:created_at => jan18_created_at, :due_date => (jan18_created_at.next_month.at_beginning_of_month + 10.days))

    Invoice.create!(
      :customer => customer,
      :amount => customer_activity.amount,
      :status => 'pending',
      :description => customer_activity.activity.name
    )
  end

  def down

  end
end
