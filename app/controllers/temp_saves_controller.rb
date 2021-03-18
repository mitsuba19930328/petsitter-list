class TempSavesController < ApplicationController
  protect_from_forgery :except => [:create, :destroy]
  before_action :login_required

  # temp_saveモデルの作成
  def create
    @temp_save = current_user.temp_save.create(petsitter_id: params[:petsitter_id])
    redirect_back(fallback_location: root_path)
  end

  # temp_saveモデルの削除
  def destroy
    @temp_save = TempSave.find_by(petsitter_id: params[:petsitter_id], user_id: current_user.id)
    @temp_save&.destroy
    redirect_back(fallback_location: root_path)
  end
end
