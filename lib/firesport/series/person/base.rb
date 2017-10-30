class Firesport::Series::Person::Base < Struct.new(:entity)
  include Draper::Decoratable
  attr_reader :participations, :rank

  def self.honor_rank
    3
  end

  def self.max_points
    30
  end

  def self.points_for_result(rank, _time, double_rank_count: 0)
    [max_points + 1 - rank - double_rank_count, 0].max
  end

  def add_participation(participation)
    @participations ||= []
    @participations.push(participation)
  end

  def participation_for_cup(cup)
    @participations.find { |participation| participation.cup == cup }
  end

  def points
    @points ||= @participations.map(&:points).sum
  end

  def best_time
    @best_time ||= @participations.map(&:time).min
  end

  def sum_time
    @sum_time ||= @participations.map(&:time).sum
  end

  def count
    @count ||= @participations.count
  end

  def <=>(other)
    compare = other.points <=> points
    return compare unless compare.zero?
    compare = other.count <=> count
    return compare unless compare.zero?
    sum_time <=> other.sum_time
  end

  def calculate_rank!(other_rows)
    other_rows.each_with_index do |rank_row, rank|
      return @rank = (rank + 1) if (self <=> rank_row).zero?
    end
  end
end
