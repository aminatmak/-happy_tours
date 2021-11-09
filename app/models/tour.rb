class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  CATEGORIES = ["Port of Call Tours", "Half-day Tours", "Shopping Malls",
                "Extreme", "Bus Tours", "Theme Parks"]
  validates :category, inclusion: { in: CATEGORIES }
end
