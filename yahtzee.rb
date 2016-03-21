class Yahtzee
  def initialize console, die_roller
    @console = console
    @die_roller = die_roller
  end

  def play
    @console.print("Category: Ones")
    rolled_dice = []
    5.times { rolled_dice << @die_roller.roll() }
    @console.print("Dice: D1:#{rolled_dice[0]} D2:#{rolled_dice[1]} D3:#{rolled_dice[2]} D4:#{rolled_dice[3]} D5:#{rolled_dice[4]}")
  end
end