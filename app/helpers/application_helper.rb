module ApplicationHelper


  # ログイン中ユーザーがこのペットシッターにcomment済みかを判定
  def current_user_reviewd_this_petsitter?(petsitter_id)
    if current_user == nil
      return false
    end
    current_user&.reviews.each do |review|
      # likeされているペットシッターIDと同じIDの場合現在のユーザーはlike済みと判定
      if review.petsitter_id == petsitter_id
        return true
      end
    end
    # 同一のIDが見つからなければfalseとして返却
    return false
  end


  # ログイン中ユーザーがこのペットシッターにlike済みかを判定
  def current_user_liked_this_petsitter?(petsitter_id)
    if current_user == nil
      return false
    end
    current_user&.likes.each do |like|
      # likeされているペットシッターIDと同じIDの場合現在のユーザーはlike済みと判定
      if like.petsitter_id == petsitter_id
        return true
      end
    end
    # 同一のIDが見つからなければfalseとして返却
    return false
  end

end
