require_relative "../../category"

describe "Yahtzee category" do
  it "has a description" do
    expect(Category.ones.description).to eq("Ones")
    expect(Category.twos.description).to eq("Twos")
    expect(Category.threes.description).to eq("Threes")
  end

  describe "Computing scores for some given dice" do
    it "does it for Ones" do
      ones = Category.ones
      expect(ones.compute_score({d1: 3, d2: 4, d3: 4, d4: 2, d5: 6})).to eq(0)
      expect(ones.compute_score({d1: 1, d2: 1, d3: 4, d4: 2, d5: 6})).to eq(2)
      expect(ones.compute_score({d1: 1, d2: 1, d3: 4, d4: 1, d5: 1})).to eq(4)
    end

    it "does it for Twos" do
      twos = Category.twos
      expect(twos.compute_score({d1: 3, d2: 4, d3: 4, d4: 2, d5: 6})).to eq(1)
      expect(twos.compute_score({d1: 1, d2: 2, d3: 4, d4: 2, d5: 6})).to eq(2)
      expect(twos.compute_score({d1: 2, d2: 2, d3: 2, d4: 2, d5: 2})).to eq(5)
    end

    it "does it for Threes" do
      threes = Category.threes
      expect(threes.compute_score({d1: 1, d2: 4, d3: 4, d4: 2, d5: 6})).to eq(0)
      expect(threes.compute_score({d1: 3, d2: 2, d3: 4, d4: 3, d5: 3})).to eq(3)
      expect(threes.compute_score({d1: 3, d2: 3, d3: 6, d4: 3, d5: 3})).to eq(4)
    end
  end
end
