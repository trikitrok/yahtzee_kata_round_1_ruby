class Categories
  def initialize notifier, reruns, scores_history, dice_roller
    @dice_roller = dice_roller
    @notifier = notifier
    @scores_history = scores_history
    @dice_roller = dice_roller
    @reruns = reruns
  end

  def play categories, num_reruns
    categories.each do |category|
      @notifier.notify_current_category(category)
      roll_all()
      @reruns.make(num_reruns)
      score = category.compute_score(last_rolled_dice)
      @scores_history.annotate_score(category, score)
      @notifier.notify_current_category_score(category, score)
    end
  end

  def roll_all
    @dice_roller.roll(@dice_roller.all_dice)
    @notifier.notify_rolled_dice(last_rolled_dice)
  end

  def last_rolled_dice
    @dice_roller.last_rolled_dice()
  end
end
