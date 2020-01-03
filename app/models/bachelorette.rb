class Bachelorette <ApplicationRecord
  has_many :contestants

  validates_presence_of :name
  validates_presence_of :season_number
  validates_numericality_of :season_number, greater_than: 0
  validates_presence_of :season_description
end
