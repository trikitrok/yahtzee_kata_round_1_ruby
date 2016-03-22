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

  def notify_current_category category
    @output.print("Category: #{DESCRIPTIONS_BY_CATEGORY[category]}")
  end

  def notify_current_category_score category, score
    @output.print("Category #{DESCRIPTIONS_BY_CATEGORY[category]} score: #{score}")
  end

  private

  DESCRIPTIONS_BY_CATEGORY = {
    ones: "Ones",
    twos: "Twos",
    threes: "Threes"
  }
end