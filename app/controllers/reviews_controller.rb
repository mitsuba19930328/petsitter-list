class ReviewsController < ApplicationController

  def create
    # ストロングパラメーターを使用してレビューインスタンス生成
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      # レビュー登録成功した場合
      flash[:success] = 'コメントしました'
      redirect_back(fallback_location: root_path)
    else
      # レビュー登録失敗した場合
      flash[:alert] = 'コメントできませんでした'
      redirect_back(fallback_location: root_path)
    end
  end

  # reviewの編集
  def edit
    @review = Review.find(params[:id])
    #
    @petsitter = Petsitter.find(session[:petsitter_id])
  end

  # reviewの編集実行
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to petsitter_path(session[:petsitter_id])
    else
      flash.now[:alert] = 'レビュー情報更新に失敗しました。'
      render petsitter_path(session[:petsitter_id])
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path, notice: "コメントを削除しました。"
  end

  private
    def review_params
      params.require(:review).permit(:title,:content,:rate,:petsitter_id)
    end
end
