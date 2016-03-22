require_relative "../../category"
require_relative "../../console_notifier"

describe "Console Notifier" do
  let(:console) { FakeConsole.new }
  let(:notifier) { ConsoleNotifier.new(console) }

  it "notifies the rolled dice" do
    notifier.notify_rolled_dice({d1: 2, d2: 4, d3: 1, d4: 6, d5: 1})

    expect(console.output).to eq(["Dice: D1:2 D2:4 D3:1 D4:6 D5:1"])
  end

  it "notifies the user to introduce which dice to rerun" do
    reruns_so_far = 1

    notifier.notify_user_to_introduce_dice_to_rerun(reruns_so_far)

    expect(console.output).to eq(["[2] Dice to re-run:"])
  end

  describe "notifying the current category" do
    it "when it is Ones" do
      notifier.notify_current_category(Category.ones)

      expect(console.output).to eq(["Category: Ones"])
    end

    it "when it is Twos" do
      notifier.notify_current_category(Category.twos)

      expect(console.output).to eq(["Category: Twos"])
    end
  end

  it "notifies the score for current category" do
    notifier.notify_current_category_score(Category.twos, 3)

    expect(console.output).to eq(["Category Twos score: 3"])
  end

  it "notifies the game score summary" do
    notifier.notify_game_score(
      {Category.ones => 3, Category.twos => 5, Category.threes => 2},
      10
    )

    expect(console.output).to eq(["Yahtzee score",
                                  "Ones: 3",
                                  "Twos: 5",
                                  "Threes: 2",
                                  "Final score: 10"])
  end
end
