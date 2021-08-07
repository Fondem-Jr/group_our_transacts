class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    
    has_many :groups
    has_many :transfers

    has_one_attached :avatar
end
