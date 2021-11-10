class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  CATEGORIES = ["Port of Call Tours", "Half-day Tours", "Shopping Malls",
                "Extreme", "Bus Tours", "Theme Parks"]
  validates :category, inclusion: { in: CATEGORIES }
  validates :address, presence: true
end
