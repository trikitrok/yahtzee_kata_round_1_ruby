require_relative "./input_line"
require_relative "./category"

class Yahtzee
  def initialize user_input_reader, notifier, dice_roller, scores_history
    @notifier = notifier
    @user_input_reader = user_input_reader
    @dice_roller = dice_roller
    @scores_history = scores_history
  end

  def play
    play_all_categories()
    summarize_score()
  end

  CATEGORIES = [Category.ones, Category.twos, Category.threes]

  private

  def play_all_categories
    categories.each do |category|
      play_category(category)
    end
  end

  def play_category category
    show_current_category(category)
    roll_all_dice()
    do_reruns()
    score = compute_score(category)
    annotate_score(category, score)
    show_current_category_score(category, score)
  end

  NUM_RERUNS = 2

  def do_reruns
    NUM_RERUNS.times do |reruns_so_far|
      ask_user_dice_to_rerun(reruns_so_far)
      roll(dice_to_rerun)
    end
  end

  def roll_all_dice
    roll(@dice_roller.all_dice)
  end

  def show_current_category category
    @notifier.notify_current_category(category)
  end

  def show_current_category_score category, score
    @notifier.notify_current_category_score(category, score)
  end

  def ask_user_dice_to_rerun reruns_so_far
    @notifier.notify_user_to_introduce_dice_to_rerun(reruns_so_far)
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
    CATEGORIES
  end

  def annotate_score category, score
    @scores_history.annotate_score(category, score)
  end

  def max_score_for category
    @scores_history.max_score_for(category)
  end

  def summarize_score()
    @notifier.notify_game_score(max_scores_by_category, final_score)
  end

  def final_score
    @scores_history.final_score
  end

  def max_scores_by_category
    categories.reduce({}) do |acc, category|
      acc[category] = @scores_history.max_score_for(category)
      acc
    end
  end
end
