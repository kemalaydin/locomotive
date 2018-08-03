class ReferenceText < ApplicationRecord
  belongs_to :user
  belongs_to :reference_code
end
