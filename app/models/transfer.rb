class Transfer < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :amount, presence: true
  validates :group_id, presence: true

  scope :dsc, -> { order('created_at DESC') }
  scope :in_u_g, -> { includes(:user, :group) }
end
