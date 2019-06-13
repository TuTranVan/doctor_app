class Calendar < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :clinic

  validates :date, presence: true
  validates :time, presence: true

  enum status: {booked: 0, finished: 1}

  scope :datest, ->{order date: :asc}
  scope :timest, ->{order time: :asc}

  scope :undatest, ->{order date: :desc}
  scope :untimest, ->{order time: :desc}
end
