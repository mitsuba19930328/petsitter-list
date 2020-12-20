class PetsittersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :index, :show]

  # ペットシッター一覧表示
  def index
    @petsitters = Petsitter.all
  end

  # ペットシッター詳細表示
  def show
    @petsitter = Petsitter.find(params[:id])
  end

  # ペットシッター新規登録ページ表示
  def new
    @petsitter = Petsitter.new
  end

  # ペットシッター新規登録処理
  def create
    # ストロングパラメーターを使用してペットシッターインスタンス生成
    @petsitter = Petsitter.new(petsitter_params)
    if @petsitter.save
      # ペットシッター登録成功した場合
      redirect_to root_path, notice: "ペットシッター登録が完了しました。"
    else
      # ペットシッター登録失敗した場合
      flash.now[:alert] = 'ペットシッター登録が失敗しました。'
      render :new
    end
  end

  # ペットシッター編集ページ表示
  def edit
    @petsitter = Petsitter.find(params[:id])
  end

  # ペットシッター更新処理
  def update
    @petsitter = Petsitter.find(params[:id])
    if @petsitter.update(petsitter_params)
      redirect_to root_path, notice: "ペットシッター情報を更新しました。"
    else
      flash.now[:alert] = 'ペットシッター情報更新に失敗しました。'
      render :edit
    end
  end

  # ペットシッター削除処理
  def destroy
    @petsitter = Petsitter.find(params[:id])
    @petsitter.destroy
    redirect_to tops_index_path, notice: "ペットシッター情報を削除しました。"
  end

  private
  # ストロングパラメーター（ペットシッターパラメーター取得用）
  def petsitter_params
    params.require(:petsitter).permit(
        :name,
               :email,
               :address,
               :prefecture,
               :town,
               :phone,
               :business_hours,
               :regular_holiday,
               :pet_type,
               :qualification,
               :registration_number,
               :insurance)
  end
end