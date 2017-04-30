class Firesport::Series::Team::SachsenSteigerCup < Firesport::Series::Team::Base
  def self.max_points
    10
  end

  def self.group_assessment_disciplines
    { hl: [''] }
  end

  def <=> other
    compare = other.points <=> points
    return compare if compare != 0
    compare = sum_time <=> other.sum_time
    return compare if compare != 0
    best_time <=> other.best_time
  end

  def sum_time
    @sum_time ||= begin
      sum = @cups.values.flatten.map(&:time).sum
      if sum >= Firesport::Series::INVALID_TIME::INVALID_TIME
        Firesport::Series::INVALID_TIME::INVALID_TIME
      else
        sum
      end
    end
  end

  def best_time
    @best_time ||= begin
      @cups.values.flatten.reject(&:time_invalid?).map(&:time).sort.first || Firesport::Series::INVALID_TIME::INVALID_TIME
    end
  end
end