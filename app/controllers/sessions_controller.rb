class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  # ログインセッション登録ページ
  def new
    @user = User.new
  end

  # ログインセッション登録処理
  def create
    # SNSログインを使った場合とそうでない場合で条件分岐
    auth = request.env['omniauth.auth']
    provider = auth&.provider

    if auth.present? # SNSログインありのケース
      if auth.info.email # emailある場合は新規登録かログインのどちらかへ進む
        # user情報を見つけるか、新規作成
        user = User.find_or_create_from_auth(auth)
        # sessionにユーザーID保存
        session[:user_id] = user.id
        redirect_to root_path, notice: "#{provider}" + "でログインしました"
      else # emailない場合はログイン不可
        flash.now[:alert] = "#{provider}" + "にはemail情報が保存されていません。ログインにはemail情報が必要です。"
        render :new
      end
    else # 既存のログインケース
      user = User.find_by(email: session_params[:email])
      # emailから取得したユーザーと、bcryptによるパスワード比較が一致するか検証
      if user&.authenticate(session_params[:password])
        # 検証成功
        session[:user_id] = user.id
        redirect_to root_path, notice: 'ログインしました。'
      else
        # 検証失敗
        flash.now[:alert] = 'ログインに失敗しました。'
        render :new
      end
    end
  end

  # ゲストログイン
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def destroy
    # user_idのセッション情報のみ削除
    session&.delete(:user_id)
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  def guest_login
    user = User.find_by(email: 'guest@example.com')
    session[:user_id] = user.id
    flash[:success] = 'ゲストユーザーとしてログインしました'
    redirect_to user_path(user)
  end

  private
    # ストロングパラメーター（セッションパラメーター取得用）
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
