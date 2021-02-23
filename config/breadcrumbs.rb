
crumb :root do
  link "ペットシッターリスト", root_path
end

  crumb :petsitters do |petsitter|
    link "全てのペットシッター", petsitters_path
    parent :root
  end

    crumb :petsitter do |petsitter|
      if controller&.controller_name == 'reviews'
        petsitter = Petsitter.find(params[:petsitter_id])
      else
        petsitter = Petsitter.find(params[:id])
      end
      # petsitter = Petsitter.find(params[:id])
      link petsitter.name, petsitter_path(petsitter.id)
      parent :petsitters
    end

      crumb :petsitter_reviews do |petsitter|
        if controller&.controller_name == 'reviews'
          petsitter = Petsitter.find(params[:petsitter_id])
        else
          petsitter = Petsitter.find(params[:id])
        end
        link petsitter.name + 'の口コミ一覧', petsitter_path(petsitter.id)
        parent :petsitter
      end

        crumb :petsitter_new_review do |petsitter|
          petsitter = Petsitter.find(params[:id])
          link petsitter.name + 'への口コミ投稿', petsitter_path(petsitter.id)
          parent :petsitter
        end

      crumb :petsitter_edit_review do |petsitter, review|
        petsitter = Petsitter.find(params[:petsitter_id])
        review = Review.find(params[:review_id])
        link '口コミ編集', edit_reviews_path(petsitter.id, review.id)
        parent :petsitter_reviews
      end

  crumb :user do |user|
    user = User.find(params[:id])
    link "#{user.name}さん のマイページ", user_path(user.id)
    parent :root
  end

    crumb :user_edit do |user|
      user = current_user
      link "ユーザ情報編集", edit_user_path(user.id)
      parent :user
    end

    crumb :user_histories do |user|
      user = User.find(params[:id])
      link "行ったお店一覧", user_histories_path(user.id)
      parent :user
    end

    crumb :user_clips do |user|
      user = User.find(params[:id])
      link "保存済み一覧", user_clips_path(user.id)
      parent :user
    end

