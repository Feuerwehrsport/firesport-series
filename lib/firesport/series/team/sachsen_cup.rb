class Firesport::Series::Team::SachsenCup < Firesport::Series::Team::LaCup
  def self.max_points
    10
  end

  protected

  def calc_participation_count
    year = @cups.try(:values).try(:first).try(:first).try(:cup).try(:round).try(:year)
    if year.present? && year.to_i < 2015
      4
    else
      3
    end
  end
end