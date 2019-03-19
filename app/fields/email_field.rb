require "administrate/field/base"

class EmailField < Administrate::Field::Base
  def to_s
    data
  end
end
