# frozen_string_literal: true

class Firesport::Series::Team::MVCup < Firesport::Series::Team::LaCup
  def self.max_points(_round, gender:)
    15
  end
end
