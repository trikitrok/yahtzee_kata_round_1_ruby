class DiceScorer
  def self.for_category(category)
    new(category)
  end

  def initialize category

  end

  def compute_score dice
    dice.select {|k,v| v == 1}.count
  end
end