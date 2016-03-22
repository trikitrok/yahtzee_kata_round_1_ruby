class DiceScorer
  def self.for_category(category)
    new(category)
  end

  def initialize category
    @category = category
  end

  def compute_score dice
    dice.select {|_, value| value == desired_value}.count
  end

  private 

  def desired_value 
    VALUES_BY_CATEGORY[@category]
  end

  VALUES_BY_CATEGORY = {ones: 1, twos: 2}
end