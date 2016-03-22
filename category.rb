class Category
  def self.ones
    new(:ones)
  end

  def self.twos
    new(:twos)
  end

  def self.threes
    new(:threes)
  end

  def initialize category_id
    @category_id = category_id
  end

  def description
    DESCRIPTIONS_BY_CATEGORY[@category_id]
  end

  def compute_score dice
    dice.select {|_, value| value == desired_value}.count
  end

  private

  DESCRIPTIONS_BY_CATEGORY = {
    ones: "Ones",
    twos: "Twos",
    threes: "Threes"
  }

  def desired_value 
    VALUES_BY_CATEGORY[@category_id]
  end

  VALUES_BY_CATEGORY = {ones: 1, twos: 2, threes: 3}
end
