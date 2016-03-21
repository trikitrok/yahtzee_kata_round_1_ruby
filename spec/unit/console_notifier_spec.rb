require_relative "../../console_notifier"

describe "Console Notifier" do
  it "notifies the rolled dice" do
    console = FakeConsole.new
    notifier = ConsoleNotifier.new(console)

    notifier.notify_rolled_dice([2, 4, 1, 6, 1])

    expect(console.output).to eq(["Dice: D1:2 D2:4 D3:1 D4:6 D5:1"])
  end
end