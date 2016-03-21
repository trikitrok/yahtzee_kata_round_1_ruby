require_relative "../../input_line"

describe "Extracting dice to rerun from an input line" do
  it "extracts the dice to rerun from an input line" do
    expect(InputLine.new("D1 D3").dice_to_rerun()).to eq([:d1, :d3])
    expect(InputLine.new("D1 D2 D3").dice_to_rerun()).to eq([:d1, :d2, :d3])
  end
end
