module UsersHelper

  # ユーザーの自己紹介を表示。空文字の場合はデフォルト文を表示
  def dispDescriptionOrDefault(user_description)
    return user_description unless user_description&.blank?
    return "こちらにあなたの自己紹介を載せることができます。自己紹介は設定ページからいつでも変えられます。"
  end


  # ログイン中ユーザーとuser画面のパラメーターIDが同じか確認する
  def ensure_current_user
    if current_user.id == params[:id].to_i
      return true
    else
      return false
    end
  end

end
