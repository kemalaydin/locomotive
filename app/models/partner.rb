class Partner < ApplicationRecord
  has_one :user, as: :type, dependent: :destroy
  accepts_nested_attributes_for :user

  enum partner_type: [:company, :organization, :person]

end
