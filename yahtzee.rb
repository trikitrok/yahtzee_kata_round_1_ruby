class Yahtzee
  def initialize console, die_roller, user_input_reader, notifier
    @console = console
    @die_roller = die_roller
    @notifier = notifier
    @user_input_reader = user_input_reader
  end

  def play
    @console.print("Category: Ones")
    roll([:d1, :d2, :d3, :d4, :d5])
    @console.print("[1] Dice to re-run:")
    dice_to_rerun = @user_input_reader.read_line()
    @notifier.notify_rolled_dice([1, 5, 1, 2, 1])
  end

  private
  def roll dice
    rolled_dice = dice.map { @die_roller.roll() }
    @notifier.notify_rolled_dice(rolled_dice)
  end
end
