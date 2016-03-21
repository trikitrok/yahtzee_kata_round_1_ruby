require_relative "./dice_roller"

class Yahtzee
  def initialize console, die_roller, user_input_reader, notifier
    @console = console
    @die_roller = die_roller
    @notifier = notifier
    @user_input_reader = user_input_reader
    @dice_roller = DiceRoller.new(@die_roller)
  end

  def play
    @console.print("Category: Ones")
    roll([:d1, :d2, :d3, :d4, :d5])
    @console.print("[1] Dice to re-run:")
    dice_to_rerun = @user_input_reader.read_line()
    @notifier.notify_rolled_dice([1, 5, 1, 2, 1])
  end

  private
  def roll dice_to_roll
    @dice_roller.roll(dice_to_roll)
    rolled_dice = @dice_roller.last_rolled_dice()
    @notifier.notify_rolled_dice(rolled_dice.values())
  end
end
