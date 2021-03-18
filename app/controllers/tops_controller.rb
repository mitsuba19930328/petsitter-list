class TopsController < ApplicationController
  protect_from_forgery :except => [:new_guest]
  skip_before_action :login_required

  def index
    # 画面表示用
    @user = current_user

    # ペットシッター一覧＋ページネーション用設定
    @petsitters = Petsitter.page(params[:page]).per(5)

    @all_petsitters = Petsitter.all
    @all_users = User.all
    @all_reviews = Review.all

    if current_user
      # likeされたペットシッターを@petsitters配列に入れていく
      @liked_petsitters = []
      current_user.likes.each do |like|
        petsitter = Petsitter.find(like.petsitter_id)
        @liked_petsitters.push(petsitter)
      end
    end
  end

  # ゲストログイン用アクション
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲスト'
      user.email = 'guest@example.com'
      user.password = SecureRandom.urlsafe_base64
      user.image = 'default.jpg'
    end
    session[:user_id] = user.id
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end

end
