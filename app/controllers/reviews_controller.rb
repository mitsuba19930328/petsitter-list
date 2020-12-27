class ReviewsController < ApplicationController

  def create
    # ストロングパラメーターを使用してレビューインスタンス生成
    params.require(:comment).permit(:rate)
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

  private
    def review_params
      params.require(:review).permit(:title,:content,:rate,:petsitter_id)
    end

end
