require_relative "../../input_line"

describe "Extracting dice to rerun from an input line" do
  it "extracts the dice to rerun from an input line" do
    input_line = InputLine.new("D1 D2 D3")

    expect(input_line.dice_to_rerun()).to eq([:d1, :d2, :d3])
  end
end
