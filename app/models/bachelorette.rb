class Bachelorette <ApplicationRecord
  has_many :contestants

  validates_presence_of :name
  validates_presence_of :season_number
  validates_numericality_of :season_number, greater_than: 0
  validates_presence_of :season_description

  def avg_contestant_age
    contestants.average(:age)
  end

  def contestant_hometowns
    contestants.select(:hometown).distinct.pluck(:hometown)
  end
end
