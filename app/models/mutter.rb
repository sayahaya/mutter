class Mutter < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  default_scope { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 140 }
end
