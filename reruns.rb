require_relative "./input_line"

class Reruns
  def initialize user_input_reader, notifier, dice_roller
    @user_input_reader = user_input_reader
    @dice_roller = dice_roller
    @notifier = notifier
  end

  def make num_reruns
    num_reruns.times do |reruns_so_far|
      ask_user_dice_to_rerun(reruns_so_far)
      roll(dice_to_rerun)
    end
  end

  private

  def dice_to_rerun
    input_line = InputLine.new(@user_input_reader.read_line())
    input_line.dice_to_rerun()
  end

  def roll dice_to_roll
    @dice_roller.roll(dice_to_roll)
    @notifier.notify_rolled_dice(@dice_roller.last_rolled_dice)
  end

  def ask_user_dice_to_rerun reruns_so_far
    @notifier.notify_user_to_introduce_dice_to_rerun(reruns_so_far)
  end
end
