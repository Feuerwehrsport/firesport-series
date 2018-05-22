class Firesport::Series::Team::ThueringenCup < Firesport::Series::Team::LaCup
  def self.max_points(_round)
    10
  end

  def self.decrement_points(points, rank)
    points -= 1 if rank.in? [2, 3]
    points -= 1 if points.positive?
    points
  end

  def <=>(other)
    compare = other.points <=> points
    return compare unless compare.zero?
    compare = best_rank <=> other.best_rank
    return compare unless compare.zero?
    compare = other.best_rank_count <=> best_rank_count
    return compare unless compare.zero?
    compare = other.ordered_participations.count <=> ordered_participations.count
    return compare unless compare.zero?
    sum_time <=> other.sum_time
  end

  protected

  def sum_time
    @sum_time ||= begin
      sum = ordered_participations.map(&:time).sum
      if sum >= Firesport::INVALID_TIME
        Firesport::INVALID_TIME
      else
        sum
      end
    end
  end

  def calc_participation_count
    4
  end
end
