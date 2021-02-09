class TopsController < ApplicationController
  skip_before_action :login_required

  def index

    # 画面表示用
    @user = current_user
    # @users = User.all
    #
    # # 検索
    # @q = Petsitter.ransack(params[:q])
    # @petsitters = @q.result(distinct: true)

    # ペットシッター一覧＋ページネーション用設定
    @petsitters = Petsitter.page(params[:page]).per(5)
    # @users = User.all.page(params[:page]).per(5)
    #
    @all_petsitters = Petsitter.all
    @all_users = User.all
    @all_reviews = Review.all

    # 以下はGoogleMapテスト
    #  @test_petsitter = Petsitter.find(1)
    # gon.address = @test_petsitter.address
    #

    if current_user
      # likeされたペットシッターを@petsitters配列に入れていく
      @liked_petsitters = []
      current_user.likes.each do |like|
        petsitter = Petsitter.find(like.petsitter_id)
        @liked_petsitters.push(petsitter)
      end
    end

  end

end
