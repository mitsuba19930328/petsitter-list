class ReviewsController < ApplicationController
  protect_from_forgery :except => [:create, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit]

  def create
    # ストロングパラメーターを使用してレビューインスタンス生成
    p current_user.id
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      # レビュー登録成功した場合
      flash[:success] = 'コメントしました'
      redirect_to petsitter_reviews_path(@review.petsitter_id)
      # redirect_back(fallback_location: root_path)
    else
      # レビュー登録失敗した場合
      flash[:alert] = 'コメントできませんでした'
      @petsitter = Petsitter.find(@review.petsitter_id)
      render 'petsitters/postReviews'
      # redirect_back(fallback_location: root_path)
    end
  end

  # reviewの編集
  def edit
    #今手に入れているのは、結果的にpetsitterのIDと同一のIDのレビュー
    # petsitter = Petsitter.find(params[:id]).reviews.each do |review|
    #   if review.user_id == current_user.id
    #
    #   end
    # end

    # @review = Review.find()
    #

    @review = Review.find(params[:review_id])
    @petsitter = Petsitter.find(params[:petsitter_id])
    # @petsitter = Petsitter.find(@review.petsitter_id)
    # @petsitter = Petsitter.find_by(id: @review.petsitter_id, user_id: current_user.id)
    # @petsitter = Petsitter.find(session[:petsitter_id])
  end

  # reviewの編集実行
  def update
    @review = Review.find(params[:id])
    @petsitter = Petsitter.find(@review.petsitter_id)
    if @review.update(review_params)
      redirect_to petsitter_path(@review.petsitter_id), notice: '変更成功！'
    else
      flash.now[:alert] = 'レビュー情報更新に失敗しました'
      # redirect_to root_path, notice: "コメントを削除しました"
      render :edit
    end
  end

  def destroy
    @review = Review.find_by(user_id: current_user.id)
    @review.destroy
    redirect_to root_path, notice: "コメントを削除しました"
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
