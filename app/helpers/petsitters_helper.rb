module PetsittersHelper


  # ユーザーIDからユーザー名を取得するメソッド
  def getUserNameByUserId(user_id)
    user_name = User.find(user_id).name
    return user_name
  end

  # ペットシッターIDからペットシッター情報を取得するメソッド
  def getPetsitterByPetistterId(petsitter_id)
    petsitter = Petsitter.find(petsitter_id)
    return petsitter
  end

  # ユーザーIDからユーザー情報を取得するメソッド
  def getUserByUserId(user_id)
    user = User.find(user_id)
    return user
  end

end
