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

    # 以下はGoogleMapテスト
    #  @test_petsitter = Petsitter.find(1)
    # gon.address = @test_petsitter.address

  end

end
