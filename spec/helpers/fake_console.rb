class FakeConsole
  attr_reader :output

  def initialize
    @output = []
  end

  def print line
    @output << line
  end
end
