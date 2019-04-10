require "administrate/base_dashboard"

class CustomerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    person_identifable_nbr: Field::String,
    email: EmailField,
    joined_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    active: Field::Boolean,
    medical_approval: Field::Boolean,
    notes: Field::Text
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :person_identifable_nbr,
    :email,
    :active,
    :medical_approval
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :person_identifable_nbr,
    :email,
    :joined_at,
    :created_at,
    :updated_at,
    :active,
    :medical_approval,
    :notes
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :person_identifable_nbr,
    :email,
    :joined_at,
    :active,
    :medical_approval,
    :notes
  ].freeze

  # Overwrite this method to customize how customers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(customer)
    customer.name
  end
end
