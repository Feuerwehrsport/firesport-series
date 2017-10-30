class Firesport::Series::Team::KPBautzen < Firesport::Series::Team::LaCup
  def self.max_points
    10
  end

  def calc_participation_count
    4
  end
end
