class Person < ApplicationRecord
  has_one :user, as: :type, dependent: :destroy
  accepts_nested_attributes_for :user

  enum gender: [ :male, :female ]
  enum job: [ :academician, :student, :employer, :employee ]
end
