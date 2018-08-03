class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :type, polymorphic: true
  has_one :reference_text
  has_one :card
  has_many :activities, :through => :card
  has_many :partner_votes, class_name: "Partner_vote", foreign_key: "user_id"

  enum status: [ :pending, :active, :red, :other ]


  def reference_issuer_detail
    reference_text.reference_code.issuer
  end
end
