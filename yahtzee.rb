class Yahtzee
  def initialize console
    @console = console
  end

  def play
    @console.print("Category: Ones")
    @console.print("Dice: D1:2 D2:4 D3:1 D4:6 D5:1")
  end
end