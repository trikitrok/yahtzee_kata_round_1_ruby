require_relative "../../dice_roller"

describe "Dice rolling" do
  it "rolls all the dice" do
    die_roller = double()
    allow(die_roller).to receive(:roll).and_return(1,2,3,4,5)
    dice_roller = DiceRoller.new(die_roller)

    dice_roller.roll_all()

    expect(dice_roller.last_rolled_dice).to eq({d1: 1, d2: 2, d3: 3, d4: 4, d5: 5})
  end

  it "rolls only the desired dice keeping the prvious value of the other ones" do
    die_roller = double()
    allow(die_roller).to receive(:roll).and_return(1,2,3,4,5,
                                                   4, 1)
    dice_roller = DiceRoller.new(die_roller)
    dice_roller.roll_all()

    dice_roller.roll([:d3, :d5])

    expect(dice_roller.last_rolled_dice).to eq({d1: 1, d2: 2, d3: 4, d4: 4, d5: 1})
  end
end
