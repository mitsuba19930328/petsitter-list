class LikesController < ApplicationController
  before_action :login_required

  # likeモデルの作成
  def create
    @like = current_user.likes.create(petsitter_id: params[:petsitter_id])
    redirect_back(fallback_location: root_path)
  end

  # likeモデルの削除
  def destroy
    @like = Like.find_by(petsitter_id: params[:petsitter_id], user_id: current_user.id)
    @like&.destroy
    redirect_back(fallback_location: root_path)
  end

end
