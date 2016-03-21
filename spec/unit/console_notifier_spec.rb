require_relative "../../console_notifier"

describe "Console Notifier" do
  let(:console) { FakeConsole.new }
  let(:notifier) { ConsoleNotifier.new(console) }

  it "notifies the rolled dice" do
    notifier.notify_rolled_dice([2, 4, 1, 6, 1])

    expect(console.output).to eq(["Dice: D1:2 D2:4 D3:1 D4:6 D5:1"])
  end

  it "notifies the user to introduce which dice to rerun" do
    reruns_so_far = 1

    notifier.notify_user_to_introduce_dice_to_rerun(reruns_so_far)

    expect(console.output).to eq(["[2] Dice to re-run:"])
  end
end