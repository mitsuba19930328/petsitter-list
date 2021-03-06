class PetsittersController < ApplicationController
  protect_from_forgery :except => [:postReviews, :create, :update, :destroy]
  before_action :make_address, only: [:create, :update]
  before_action :regular_holiday_string, only: [:create, :update]
  before_action :pet_type_string, only: [:create, :update]
  before_action :admin_user, only:[:new, :create, :edit, :update, :destroy]
  before_action :set_petsitter, only:[:show, :details, :reviews, :postReviews,:map] # 企業詳細ページの共通処理
  skip_before_action :login_required, only: [:index, :show, :details, :reviews, :map]
  include PetsittersHelper
  PER = 5

  # ペットシッター一覧表示
  def index
    # 検索
    @q = Petsitter.ransack(params[:q])
    # 検索に引っ掛かったペットシッターをページネーション加工したもの
    @petsitters = @q.result(distinct: true).page(params[:page]).per(PER)

    # searched_petsitters_countは検索に引っ掛かったペットシッターの数
    @searched_petsitters_count = @q.result(distinct: true)&.count
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
    redirect_to root_path, notice: "ペットシッター情報を削除しました。"
  end

  # ペットシッター詳細表示
  def show
  end

  def details
  end

  def reviews
    # 新規レビュー用インスタンス
    @review = Review.new

    # reviewコントローラーなどで使うため@petsitter.idをsessionに保存
    session[:petsitter_id] = @petsitter.id
  end

  def postReviews
    # 新規レビュー用インスタンス
    @review = Review.new

    # reviewコントローラーなどで使うため@petsitter.idをsessionに保存
    session[:petsitter_id] = @petsitter.id

    # 自分のコメントがあるかチェックする
    @is_my_review = @reviews.find_by(user_id: current_user.id)
  end


  def map
    # マップ（mapに移管する予定）
    # 以下はGoogleMapテスト
    gon.address = @petsitter.address
  end

  # 住所作成処理
  def make_address
    # パラメーターの加工
    # 住所加工
    prefecture = params.require(:petsitter)[:prefecture]
    town = params.require(:petsitter)[:town]
    block = params.require(:petsitter)[:block]
    apartment = params.require(:petsitter)[:apartment]
    params.require(:petsitter)[:address] = prefecture + town + block + apartment
  end

  # 定休日の配列を文字列にする（/区切り）
  def regular_holiday_string
    params[:petsitter][:regular_holiday] = params[:petsitter][:regular_holiday]&.join("/")  || "" # to string
  end

  # 対応可能動物の配列を文字列にする（、区切り）
  def pet_type_string
    params[:petsitter][:pet_type] = params[:petsitter][:pet_type]&.join("、")  || "" # to string
  end

  private
  # ストロングパラメーター（ペットシッターパラメーター取得用）
  def petsitter_params
    params.require(:petsitter).permit(
        :name,
               :url,
               :address,
               :prefecture,
               :town,
               :block,
               :apartment,
               :area,
               :phone,
               :business_hours,
               :regular_holiday,
               :pet_type,
               :overview,
               :qualification,
               :registration_number,
               :insurance,
               :image,)
  end

  # 管理者権限有無の確認
  def admin_user
    @users = User.all
    if  current_user.admin == false
      flash[:alert] = 'この操作には管理者権限が必要です。'
      redirect_to root_path
    end
  end

  # 企業詳細ページの共通処理
  def set_petsitter
    # 該当のペットシッターを検索
    @petsitter = Petsitter.find(params[:id])

    # 新規いいね用インスタンス
    @like = Like.new

    # 新規一時保存用インスタンス
    @temp_save = TempSave.new

    # 該当のペットシッターIDで検索できるレビューを取得
    @reviews = Review.where(petsitter: @petsitter.id)
  end

end