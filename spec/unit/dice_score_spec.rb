require_relative "../../dice_scorer"

describe "Scoring dice by category" do
  it "computes the dice score for Ones" do
    scorer = DiceScorer.for_category(:ones)

    expect(scorer.compute_score({d1: 3, d2: 4, d3:4, d4: 2, d5: 6})).to eq(0)
    expect(scorer.compute_score({d1: 1, d2: 1, d3:4, d4: 2, d5: 6})).to eq(2)
    expect(scorer.compute_score({d1: 1, d2: 1, d3:4, d4: 1, d5: 1})).to eq(4)
  end

  it "computes the dice score for Twos" do
    scorer = DiceScorer.for_category(:twos)

    expect(scorer.compute_score({d1: 3, d2: 4, d3:4, d4: 2, d5: 6})).to eq(1)
    expect(scorer.compute_score({d1: 1, d2: 2, d3:4, d4: 2, d5: 6})).to eq(2)
    expect(scorer.compute_score({d1: 2, d2: 2, d3:2, d4: 2, d5: 2})).to eq(5)
  end

end
