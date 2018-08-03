class Admin < ApplicationRecord
  has_one :user, as: :type, dependent: :destroy
  accepts_nested_attributes_for :user
end
