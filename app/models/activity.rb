class Activity < ApplicationRecord
  belongs_to :card
  has_one :users, :through => :card
  validates_presence_of :activity_type, :card_id, :activity_code


  enum activity_type: [:exit, :entrance, :pending]

end
