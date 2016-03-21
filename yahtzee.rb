class Yahtzee
  def initialize console, die_roller, notifier
    @console = console
    @die_roller = die_roller
    @notifier = notifier
  end

  def play
    @console.print("Category: Ones")
    roll([:d1, :d2, :d3, :d4, :d5])
    @console.print("[1] Dice to re-run:")
    @notifier.notify_rolled_dice([1, 5, 1, 2,1])
  end

  private
  def roll dice
    rolled_dice = dice.map { @die_roller.roll() }
    @notifier.notify_rolled_dice(rolled_dice)
  end
end
