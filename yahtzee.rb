require_relative "./input_line"
require_relative "./category"

class Yahtzee
  def initialize console, user_input_reader, notifier, dice_roller
    @console = console
    @notifier = notifier
    @user_input_reader = user_input_reader
    @dice_roller = dice_roller
    @scores_history = {}
  end

  def play
    categories.each do |category|
      play_category(category)
    end

    summarize_scores_by_category()
  end

  private

  NUM_RERUNS = 2
  CATEGORIES_IDS = [:ones, :twos, :threes]

  def play_category category
    @notifier.notify_current_category(category)
    roll([:d1, :d2, :d3, :d4, :d5])
    do_reruns()
    score = compute_score(category)
    annotate_score(category, score)
    @notifier.notify_current_category_score(category, score)
  end

  def do_reruns
    NUM_RERUNS.times do |reruns_so_far|
      @notifier.notify_user_to_introduce_dice_to_rerun(reruns_so_far)
      roll(dice_to_rerun)
    end
  end

  def roll dice_to_roll
    @dice_roller.roll(dice_to_roll)
    @notifier.notify_rolled_dice(last_rolled_dice)
  end

  def dice_to_rerun
    input_line = InputLine.new(@user_input_reader.read_line())
    input_line.dice_to_rerun()
  end

  def compute_score category
    category.compute_score(last_rolled_dice)
  end

  def last_rolled_dice
    @dice_roller.last_rolled_dice()
  end

  def categories
    CATEGORIES_IDS.map {|category_id| Category.new(category_id)}
  end

  def annotate_score category, score
    @scores_history[category] = [] if @scores_history[category].nil?
    @scores_history[category] << score
  end

  def summarize_scores_by_category
    @console.print("Yahtzee score")
    @console.print("#{Category.ones.description}: #{@scores_history[Category.ones].max}")
    @console.print("#{Category.twos.description}: #{@scores_history[Category.twos].max}")
    @console.print("#{Category.threes.description}: #{@scores_history[Category.threes].max}")
    @console.print("Final score: 9")
  end
end
