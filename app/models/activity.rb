class Activity < ApplicationRecord
  belongs_to :card
  has_one :users, :through => :card

  enum activity_type: [:exit, :entrance]

end
