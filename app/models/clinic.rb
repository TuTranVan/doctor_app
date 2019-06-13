class Clinic < ApplicationRecord
  belongs_to :user
  has_one :physician, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :calendars, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :introduce, presence: true

  scope :newest, ->{order created_at: :desc}

  def rating
    total_times = reviews.count
    total_score = reviews.sum(:score)
    if total_times > 0
      (total_score/total_times).to_i
    else
      0
    end
  end
end
