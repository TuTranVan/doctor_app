class Major < ApplicationRecord
  has_many :physicians, dependent: :destroy

  validates :name, presence: true
end
