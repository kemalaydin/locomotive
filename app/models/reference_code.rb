class ReferenceCode < ApplicationRecord
  belongs_to :issuer, class_name: "User", foreign_key: "issuer_id"
  belongs_to :user
end
