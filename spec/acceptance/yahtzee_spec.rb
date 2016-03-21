require_relative '../../yahtzee'
require_relative '../helpers/fake_console'

describe "Yahtzee game" do
  it "produces the expected output" do
    die_roller = double()
    expect(die_roller).to receive(:roll).and_return(2,4,1,6,1)
    console = FakeConsole.new
    yahtzee = Yahtzee.new(console, die_roller)

    yahtzee.play

    expect(console.output).to eq(["Category: Ones",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1"])
  end
end
