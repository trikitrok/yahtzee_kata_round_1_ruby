require_relative "../../in_memory_scores_history"

describe "Scores history" do
  let(:categories) {[Category.ones, Category.twos, Category.threes]}
  let(:scores_history) {
    scores_history = InMemoryScoresHistory.new(categories)
    annotate_several_scores(scores_history)
    scores_history
  }

  it "keeps the scores history and returns the maximum score by category" do
    expect(scores_history.max_score_for(Category.ones)).to eq(3)
    expect(scores_history.max_score_for(Category.twos)).to eq(4)
    expect(scores_history.max_score_for(Category.threes)).to eq(5)
  end

  it "keeps the scores history and returns the final score" do
    expect(scores_history.final_score()).to eq(12)
  end

  it "keeps the scores history and returns all the maximum scores by category" do
    expect(scores_history.max_scores_by_category(categories)).to eq(
      {
        Category.ones => 3,
        Category.twos => 4,
        Category.threes => 5
      }
    )
  end

  def annotate_several_scores scores_history
    scores_history.annotate_score(Category.ones, 3)
    scores_history.annotate_score(Category.twos, 2)
    scores_history.annotate_score(Category.threes, 1)
    scores_history.annotate_score(Category.twos, 4)
    scores_history.annotate_score(Category.threes, 5)
    scores_history.annotate_score(Category.twos, 3)
    scores_history.annotate_score(Category.twos, 1)
    scores_history.annotate_score(Category.threes, 3)
  end
end
