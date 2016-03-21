class InputLine
  def initialize line
    @line = line
  end

  def dice_to_rerun
    @line.split(" ").map{ |die_as_str| die_as_str.downcase.to_sym }
  end
end
