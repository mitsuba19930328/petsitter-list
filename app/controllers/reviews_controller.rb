class ReviewsController < ApplicationController
  protect_from_forgery :except => [:create, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit]

  def create
    # ストロングパラメーターを使用してレビューインスタンス生成
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    # 現在のユーザーがすでに該当のペットシッターにコメントをしているか確認
    is_current_user_commented = Review.find_by(user_id: current_user.id, petsitter_id: @review.petsitter_id)

    # 現在のユーザーがペットシッターにコメント済みの場合、エラーへ分岐させる
    if is_current_user_commented
      # レビュー登録失敗した場合
      flash[:alert] = 'コメントできませんでした'
      @petsitter = Petsitter.find(@review.petsitter_id)
      render  template: 'petsitters/postReviews' and return
    end

    # まだコメントしていない場合は、コメントを登録させる
    if @review.save
      # レビュー登録成功した場合
      flash[:success] = 'コメントしました'
      redirect_to petsitter_reviews_path(@review.petsitter_id)
    else
      # レビュー登録失敗した場合
      flash[:alert] = 'コメントできませんでした'
      @petsitter = Petsitter.find(@review.petsitter_id)
      render 'petsitters/postReviews'
    end
  end

  # reviewの編集
  def edit
    @review = Review.find(params[:review_id])
    @petsitter = Petsitter.find(params[:petsitter_id])
  end

  # reviewの編集実行
  def update
    @review = Review.find(params[:id])
    @petsitter = Petsitter.find(@review.petsitter_id)
    if @review.update(review_params)
      redirect_to petsitter_path(@review.petsitter_id), notice: 'レビュー情報を修正しました'
    else
      flash.now[:alert] = 'レビュー情報更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @review = Review.find_by(user_id: current_user.id)
    @review.destroy
    redirect_to petsitter_path(@review.petsitter_id), notice: 'レビュー情報を削除しました'
  end

  private
    def review_params
      params.require(:review).permit(:title,:content,:rate,:petsitter_id)
    end

    # review/editにアクセスしたユーザーがコメント投稿主か確認
    def ensure_correct_user
      review = Review.find(params[:review_id])
      if current_user.id != review.user_id.to_i
        flash[:alert] = 'コメント投稿者とログイン中ユーザーが異なります。'
        redirect_to(root_path)
      end
    end
end
