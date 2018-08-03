class ReferenceCode < ApplicationRecord
  belongs_to :issuer
  belongs_to :user
end
