class Category < ApplicationRecord
  has_many :tasks
  # belongs_to :user

  validates :title, presence: true
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
