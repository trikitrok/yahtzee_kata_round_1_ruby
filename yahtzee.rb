require_relative "./category"

class Yahtzee
  def initialize notifier, scores_history, categories
    @notifier = notifier
    @scores_history = scores_history
    @categories = categories
  end

  def play
    @categories.play(CATEGORIES, NUM_RERUNS)
    summarize_score()
  end

  CATEGORIES = [Category.ones, Category.twos, Category.threes]

  private

  NUM_RERUNS = 2

  def summarize_score()
    @notifier.notify_game_score(
      @scores_history.max_scores_by_category(CATEGORIES),
      @scores_history.final_score
    )
  end
end
