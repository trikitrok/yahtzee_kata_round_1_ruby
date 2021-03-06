require_relative "../../dice_roller"

describe "Dice rolling" do
  it "rolls all the dice" do
    dice_roller = a_dice_roller_rolling_values(1,2,3,4,5)

    dice_roller.roll(dice_roller.all_dice)

    expect(dice_roller.last_rolled_dice).to eq({d1: 1, d2: 2, d3: 3, d4: 4, d5: 5})
  end

  it "rolls only the desired dice keeping the prvious value of the other ones" do
    dice_roller = dice_roller = a_dice_roller_rolling_values(1,2,3,4,5,
                                                                 4,1)
    dice_roller.roll(dice_roller.all_dice)
    any_dice_to_reroll = [:d3, :d5]
    
    dice_roller.roll(any_dice_to_reroll)

    expect(dice_roller.last_rolled_dice).to eq({d1: 1, d2: 2, d3: 4, d4: 4, d5: 1})
  end

  def a_dice_roller_rolling_values *values
    die_roller = double()
    allow(die_roller).to receive(:roll).and_return(*values)
    DiceRoller.new(die_roller)
  end
end
