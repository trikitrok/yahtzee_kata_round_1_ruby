require_relative '../../yahtzee'
require_relative '../helpers/fake_console'

describe "Yahtzee game" do
  it "produces the expected output" do
    console = FakeConsole.new
    yahtzee = Yahtzee.new(console)

    yahtzee.play

    expect(console.output).to eq(["Category: Ones",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1"])
  end
end
