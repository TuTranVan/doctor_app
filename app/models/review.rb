class Review < ApplicationRecord
  belongs_to :patient
  belongs_to :clinic

  validates :score, presence: true
  validates :content, presence: true

  scope :newest, ->{order created_at: :desc}
end
