class Contact < ApplicationRecord
  has_one :address

  accepts_nested_attributes_for :address, allow_destroy: true
end
