class Location < ActiveRecord::Base

  # Associations
  belongs_to :geocoded_city
  has_many :users

  # Validations
  validates :name, presence: true, uniqueness: true

end