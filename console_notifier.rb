class ConsoleNotifier
  def initialize output
    @output = output
  end

  def notify_rolled_dice rolled_dice
    formatted_dice_strs = rolled_dice.each_with_index.map do |die, i|
      "D#{i+1}:#{rolled_dice[i]}"
    end
    @output.print("Dice: " + formatted_dice_strs.join(" "))
  end

  def notify_user_to_introduce_dice_to_rerun reruns_so_far
    @output.print("[#{reruns_so_far+1}] Dice to re-run:")
  end
end