class Patient < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :calendars, dependent: :destroy

  validates :name, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :address, presence: true
  validates :phone, presence: true
end
