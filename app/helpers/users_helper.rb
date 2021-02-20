module UsersHelper


  # ログイン中ユーザーとuser画面のパラメーターIDが同じか確認する
  def ensure_current_user
    if current_user.id == params[:id].to_i
      return true
    else
      return false
    end
  end

end
