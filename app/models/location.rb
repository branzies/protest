class Location < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode


  validates :address, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :danger_level, presence: true
end
