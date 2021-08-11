class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 4, maximum: 24 }
  

  belongs_to :user

  has_many :transfers
  has_one_attached :icon
end
