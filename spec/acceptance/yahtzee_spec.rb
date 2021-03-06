require_relative '../../yahtzee'
require_relative '../../reruns'
require_relative "../../dice_roller"
require_relative "../../console_notifier"
require_relative '../helpers/fake_console'
require_relative "../../in_memory_scores_history"
require_relative "../../categories"

describe "Yahtzee game" do
  it "produces the expected output" do
    die_roller = double()
    expect(die_roller).to receive(:roll).and_return(2, 4, 1, 6, 1,
                                                    1, 5, 2,
                                                    1, 5,
                                                    2, 4, 1, 6, 1,
                                                    2, 3,
                                                    6, 1, 2,
                                                    2, 4, 1, 6, 1,
                                                    5, 1, 3, 2, 3,
                                                    6, 2, 4)
    user_input_reader = double()
    expect(user_input_reader).to receive(:read_line).and_return("D1 D2 D4",
                                                                "D2 D4",
                                                                "D2 D5",
                                                                "D3 D4 D5",
                                                                "D1 D2 D3 D4 D5",
                                                                "D1 D2 D4")
    console = FakeConsole.new
    notifier = ConsoleNotifier.new(console)
    dice_roller = DiceRoller.new(die_roller)
    scores_history = InMemoryScoresHistory.new(Yahtzee::CATEGORIES)
    reruns = Reruns.new(user_input_reader, notifier, dice_roller)
    categories = Categories.new(notifier, reruns, scores_history, dice_roller)
    yahtzee = Yahtzee.new(notifier, scores_history, categories)

    yahtzee.play

    expect(console.output).to eq(["Category: Ones",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1",
                                  "[1] Dice to re-run:",
                                  "Dice: D1:1 D2:5 D3:1 D4:2 D5:1",
                                  "[2] Dice to re-run:",
                                  "Dice: D1:1 D2:1 D3:1 D4:5 D5:1",
                                  "Category Ones score: 4",
                                  "Category: Twos",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1",
                                  "[1] Dice to re-run:",
                                  "Dice: D1:2 D2:2 D3:1 D4:6 D5:3",
                                  "[2] Dice to re-run:",
                                  "Dice: D1:2 D2:2 D3:6 D4:1 D5:2",
                                  "Category Twos score: 3",
                                  "Category: Threes",
                                  "Dice: D1:2 D2:4 D3:1 D4:6 D5:1",
                                  "[1] Dice to re-run:",
                                  "Dice: D1:5 D2:1 D3:3 D4:2 D5:3",
                                  "[2] Dice to re-run:",
                                  "Dice: D1:6 D2:2 D3:3 D4:4 D5:3",
                                  "Category Threes score: 2",
                                  "Yahtzee score",
                                  "Ones: 4",
                                  "Twos: 3",
                                  "Threes: 2",
                                  "Final score: 9"])
  end
end
