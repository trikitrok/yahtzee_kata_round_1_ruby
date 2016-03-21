class Yahtzee
  def initialize console, die_roller
    @console = console
    @die_roller = die_roller
  end

  def play
    @console.print("Category: Ones")
    roll([:d1, :d2, :d3, :d4, :d5])
  end

  private 
  def roll dice
    rolled_dice = dice.map { @die_roller.roll() }
    notify_rolled_dice(rolled_dice)
  end

  def notify_rolled_dice rolled_dice
    formatted_dice_strs = rolled_dice.each_with_index.map do |die, i|
      "D#{i+1}:#{rolled_dice[i]}"
    end
    @console.print("Dice: " + formatted_dice_strs.join(" "))
  end
end