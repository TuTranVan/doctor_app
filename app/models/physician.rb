class Physician < ApplicationRecord
  belongs_to :major
  belongs_to :clinic

  validates :name, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
