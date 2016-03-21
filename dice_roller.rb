class DiceRoller
  def initialize die_roller
    @die_roller = die_roller
    @last_rolled_dice = {}
  end

  def roll dice_to_roll
    @last_rolled_dice = dice_to_roll.reduce({}) do |acc, die|
      acc[die] = @die_roller.roll()
      acc
    end
  end

  attr_reader :last_rolled_dice
end