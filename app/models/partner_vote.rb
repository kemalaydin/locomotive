class PartnerVote < ApplicationRecord
  belongs_to :partner, class_name: "User", foreign_key: "partner_id"
  belongs_to :user
end
