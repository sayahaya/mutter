class Like < ApplicationRecord
  belongs_to :user
  belongs_to :mutter
  validates :user_id, uniqueness: { scope: :mutter_id }
end
