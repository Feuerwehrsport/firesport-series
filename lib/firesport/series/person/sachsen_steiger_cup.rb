class Firesport::Series::Person::SachsenSteigerCup < Firesport::Series::Person::MVCup
  def self.max_points
    30
  end

  def self.assessment_disciplines
    { hl: ['', 'Nachwuchs'] }
  end

  def <=> other
    compare = other.points <=> points
    return compare if compare != 0
    compare = sum_time <=> other.sum_time
    return compare if compare != 0
    best_time <=> other.best_time
  end
end