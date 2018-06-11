class Firesport::Series::Team::TglCup < Firesport::Series::Team::LaCup
  def self.max_points(round)
    case round.year.to_i
    when 2018 then 16
    when 2017 then 10
    when 2016 then 13
    else 15
    end
  end

  def points
    points = super
    points -= 2 if round.id == 54 && team.id == 438
    points
  end

  def calc_participation_count
    round.full_cup_count - 1
  end

  def <=>(other)
    compare = other.points <=> points
    return compare unless compare.zero?
    compare = best_rank <=> other.best_rank
    return compare unless compare.zero?
    compare = other.best_rank_count <=> best_rank_count
    return compare unless compare.zero?
    other.ordered_participations.count <=> ordered_participations.count
  end
end
