class ReferenceCode < ApplicationRecord
  belongs_to :issuer, class_name: 'User', foreign_key: 'issuer_id'
  belongs_to :user, optional: true
  enum status: [ :used, :unused ]
end
