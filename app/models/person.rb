class Person < ApplicationRecord
  has_one :user, as: :type, dependent: :destroy
  has_one :reference_text, dependent: :destroy
  accepts_nested_attributes_for :user
  validates_presence_of :name, :surname, :age, :gender, :job, :phone

  enum gender: [ :male, :female ]
  enum job: [ :akademisyen, :ogrenci, :isveren, :calisan ]
end
