require "administrate/base_dashboard"

class DiscountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    value: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    discount_type: EnumOptionField.with_options(
      :choices => Discount::TYPE.values.map { |type| [I18n.t("administrate.sections.discount.discount_type.#{type}"), type] }
    ),
    code: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :value,
    :discount_type
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :name,
    :value,
    :discount_type
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :discount_type,
    :value,
  ].freeze

  # Overwrite this method to customize how activities are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(discount)
    discount.name
  end
end
