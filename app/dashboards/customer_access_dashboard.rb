require "administrate/base_dashboard"

class CustomerAccessDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    customer: Field::BelongsTo,
    id: Field::Number,
    timestamp: Field::DateTime.with_options(searchable: false, format: '%Y-%m-%d a las %H:%M:%S'),
    client_name: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :client_name,
    :timestamp,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :customer,
    :timestamp
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :customer,
    :timestamp,
  ].freeze

  # Overwrite this method to customize how customer accesses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(customer_access)
  #   "CustomerAccess ##{customer_access.id}"
  # end
end
