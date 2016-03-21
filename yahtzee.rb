class Yahtzee
  def initialize console, user_input_reader, notifier, dice_roller
    @console = console
    @notifier = notifier
    @user_input_reader = user_input_reader
    @dice_roller = dice_roller
  end

  def play
    @console.print("Category: Ones")
    roll([:d1, :d2, :d3, :d4, :d5])
    @console.print("[1] Dice to re-run:")
    roll(dice_to_rerun)
  end

  private

  def roll dice_to_roll
    @dice_roller.roll(dice_to_roll)
    rolled_dice = @dice_roller.last_rolled_dice()
    @notifier.notify_rolled_dice(rolled_dice.values())
  end

  def dice_to_rerun
    user_input = @user_input_reader.read_line()
    user_input.split(" ").map{|die_as_str| die_as_str.downcase.to_sym }
  end
end
