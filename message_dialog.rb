module MessageDialog
  # 攻撃時のメッセージ
  def attack_message(**params)
    attack_type = params[:attack_type]
    puts "#{@name}の攻撃"
    puts "必殺攻撃" if attack_type == "special_attack"
  end

  # ダメージを受けた時のメッセージ
  def damage_message

  end

  # バトルが終了した時のメッセージ
  def end_message

  end
end