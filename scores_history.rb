require_relative "./category"

class ScoresHistory
  def initialize categories
    @scores_history = categories.reduce({}) do |acc, category|
      acc[category] = []
      acc
    end
  end

  def annotate_score category, score
    @scores_history[category] = [] if @scores_history[category].nil?
    @scores_history[category] << score
  end

  def max_score_for category
    @scores_history[category].max
  end
end
