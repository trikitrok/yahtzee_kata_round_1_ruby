require_relative "../../scores_history"

describe "Scores history" do
  it "keeps the scores history and returns the maximum score by category and the final score" do
    scores_history = ScoresHistory.new([Category.ones, Category.twos, Category.threes])

    scores_history.annotate_score(Category.ones, 3)
    scores_history.annotate_score(Category.twos, 2)
    scores_history.annotate_score(Category.threes, 1)
    scores_history.annotate_score(Category.twos, 4)
    scores_history.annotate_score(Category.threes, 5)
    scores_history.annotate_score(Category.twos, 3)
    scores_history.annotate_score(Category.twos, 1)
    scores_history.annotate_score(Category.threes, 3)

    expect(scores_history.max_score_for(Category.ones)).to eq(3)
    expect(scores_history.max_score_for(Category.twos)).to eq(4)
    expect(scores_history.max_score_for(Category.threes)).to eq(5)
    expect(scores_history.final_score()).to eq(12)
  end
end
