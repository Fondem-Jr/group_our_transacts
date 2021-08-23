class Transfer < ApplicationRecord
  belongs_to :user
  belongs_to :group,  optional: true

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true

  scope :dsc, -> { order('created_at DESC') }
  scope :in_u_g, -> { includes(:user, :group) }
end
