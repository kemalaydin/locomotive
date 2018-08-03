class PartnerVote < ApplicationRecord
  belongs_to :partner
  belongs_to :user
end
