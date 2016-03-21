require_relative "../../dice_roller"

describe "Dice rolling" do
  it "rolls the given dice" do
    die_roller = double()
    allow(die_roller).to receive(:roll).and_return(1,2,3,4,5)
    dice_roller = DiceRoller.new(die_roller)

    dice_roller.roll([:d1, :d2, :d3, :d4, :d5])

    expect(dice_roller.last_rolled_dice).to eq({d1: 1, d2: 2, d3: 3, d4: 4, d5: 5})
  end
end