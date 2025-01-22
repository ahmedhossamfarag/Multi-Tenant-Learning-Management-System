class ChatRoom < ApplicationRecord
  belongs_to :user, -> { where(role: :student) }

  validates :user_id, presence: true
  validates :title, presence: true, uniqueness: true
end
