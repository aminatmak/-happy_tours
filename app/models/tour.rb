class Tour < ApplicationRecord
  has_many :users
  has_many :bookings
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  CATEGORIES = ["indoors", "outdoors", "sightseeing", "sport", "adventure", "historical"]
  validates :category, inclusion: { in: CATEGORIES }
end
