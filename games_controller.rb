class GamesController

  include MessageDialog

  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  def battle(**params)
    build_characters(params)

    loop do
      @brave.attack(@monster)
      break if battle_end?
      puts "-----------"
      @monster.attack(@brave)
      break if battle_end?
      puts "-----------"
    end

    battle_judgment

  end

  private

  def build_characters(**params)
    @brave = params[:brave]
    @monster= params[:monster]
  end

  def battle_end?
    @monster.hp <= 0 || @brave.hp <= 0
  end

  def battle_win?
    @brave.hp > 0
  end

  def calculate_of_exp_and_gold
    exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
    gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
    result = {exp: exp, gold: gold}
    return result
  end

  def battle_judgment
    result = calculate_of_exp_and_gold
    end_message(result)
  end
end