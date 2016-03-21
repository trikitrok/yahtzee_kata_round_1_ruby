require_relative '../../yahtzee'
require_relative '../helpers/fake_console'

describe "Yahtzee game" do
  it "produces the expected output" do
    die_roller = double()
    expect(die_roller).to receive(:roll).and_return(2,4,1,6,1)
    user_input_reader = double()
    expect(user_input_reader).to receive(:read_line).and_return("D1 D2 D4")
    console = FakeConsole.new
    notifier = ConsoleNotifier.new(console)
    yahtzee = Yahtzee.new(console, die_roller, user_input_reader, notifier)

    yahtzee.play

    expect(console.output).to eq(["Category: Ones",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1",
                                  "[1] Dice to re-run:",
                                  "Dice: D1:1 D2:5 D3:1 D4:2 D5:1"])
  end
end
