require "./input_line"

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
    do_reruns()
    @console.print("Category Ones score: 4")
  end

  private

  NUM_RERUNS = 2

  def do_reruns
    NUM_RERUNS.times do |reruns_so_far|
      @notifier.notify_user_to_introduce_dice_to_rerun(reruns_so_far)
      roll(dice_to_rerun)
    end
  end

  def roll dice_to_roll
    @dice_roller.roll(dice_to_roll)
    rolled_dice = @dice_roller.last_rolled_dice()
    @notifier.notify_rolled_dice(rolled_dice.values())
  end

  def dice_to_rerun
    input_line = InputLine.new(@user_input_reader.read_line())
    input_line.dice_to_rerun()
  end
end
