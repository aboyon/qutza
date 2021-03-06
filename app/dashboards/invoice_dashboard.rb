require "administrate/base_dashboard"

class InvoiceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    customer: Field::BelongsTo.with_options(searchable: false),
    id: Field::Number,
    status: EnumOptionField.with_options(
      :choices => Invoice::STATUS.values.map { |status| [I18n.t("administrate.sections.invoice.status.#{status}"), status] }
    ),
    payment_receipt: Field::String,
    amount: Field::Number.with_options(decimals: 2),
    amount_paid: Field::Number.with_options(decimals: 2),
    invoice_uid: Field::String,
    description: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    client_name: Field::String.with_options(searchable: false),
    due_date: Field::DateTime.with_options(format: '%Y-%m-%d'),
    period: Field::String.with_options(searchable: false),
    discounts: Field::HasMany
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :invoice_uid,
    :client_name,
    :status,
    :payment_receipt,
    :description,
    :period
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :client_name,
    :status,
    :payment_receipt,
    :amount,
    :amount_paid,
    :invoice_uid,
    :description,
    :created_at,
    :due_date,
    :period
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :status,
    :payment_receipt,
    :amount_paid,
    :discounts
  ].freeze

  # Overwrite this method to customize how invoices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(invoice)
  #   "Invoice ##{invoice.id}"
  # end
end
