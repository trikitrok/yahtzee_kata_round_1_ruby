require_relative '../../yahtzee'
require_relative "../../dice_roller"
require_relative "../../console_notifier"
require_relative '../helpers/fake_console'

describe "Yahtzee game" do
  it "produces the expected output" do
    die_roller = double()
    expect(die_roller).to receive(:roll).and_return(2,4,1,6,1,
                                                    1, 5, 2,
                                                    1, 5)
    user_input_reader = double()
    expect(user_input_reader).to receive(:read_line).and_return("D1 D2 D4",
                                                                "D2 D4")
    console = FakeConsole.new
    notifier = ConsoleNotifier.new(console)
    dice_roller = DiceRoller.new(die_roller)
    yahtzee = Yahtzee.new(console, user_input_reader, notifier, dice_roller)

    yahtzee.play

    expect(console.output).to eq(["Category: Ones",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1",
                                  "[1] Dice to re-run:",
                                  "Dice: D1:1 D2:5 D3:1 D4:2 D5:1",
                                  "[2] Dice to re-run:",
                                  "Dice: D1:1 D2:1 D3:1 D4:5 D5:1",
                                  "Category Ones score: 4"])
  end
end
