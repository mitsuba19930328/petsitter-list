class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  # ユーザー詳細表示
  def show
    # # 検索
    @q = Petsitter.ransack(params[:q])
    @petsitters = @q.result(distinct: true)
    @user = User.find(params[:id])
  end

  # ユーザー新規登録ページ表示
  def new
    # # 検索
    @q = Petsitter.ransack(params[:q])
    @petsitters = @q.result(distinct: true)
    @user = User.new
  end

  # ユーザー新規登録処理
  def create
    # ストロングパラメーターを使用してユーザーインスタンス生成
    @user = User.new(user_params)
    if @user.save
      # ユーザー登録成功した場合
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ユーザー登録が完了しました。"
    else
      # ユーザー登録失敗した場合
      flash.now[:alert] = 'ユーザー登録が失敗しました。'
      render :new
    end
  end

  # ユーザー編集ページ表示
  def edit
    # # 検索
    @q = Petsitter.ransack(params[:q])
    @petsitters = @q.result(distinct: true)
    @user = User.find(params[:id])
  end

  # ユーザー更新処理
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "ユーザー情報を更新しました。"
    else
      flash.now[:alert] = 'ユーザー情報更新に失敗しました。'
      render :edit
    end
  end

  # ユーザー削除処理
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to tops_index_path, notice: "ユーザー情報を削除しました。"
  end

  def histories
    # 該当のペットシッターを検索
    @petsitter = Petsitter.find(params[:id])

    # 現在のユーザーがレビュー投稿したペットシッターを@petsitters配列に入れていく
    @petsitters = []
    current_user.reviews.each do |review|
      petsitter = Petsitter.find(review.petsitter_id)
      @petsitters.push(petsitter)
    end


  end

  def clips
    # 該当のペットシッターを検索
    @petsitter = Petsitter.find(params[:id])

    # likeされたペットシッターを@petsitters配列に入れていく
    @petsitters = []
    current_user.likes.each do |like|
      petsitter = Petsitter.find(like.petsitter_id)
      @petsitters.push(petsitter)
    end
  end



  private
    # ストロングパラメーター（ユーザーパラメーター取得用）
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
end