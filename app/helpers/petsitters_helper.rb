module PetsittersHelper


  # ユーザーIDからユーザー名を取得するメソッド
  def getUserNameByUserId(user_id)
    user_name = User.find(user_id).name
    return user_name
  end

end
