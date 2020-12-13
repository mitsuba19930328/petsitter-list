class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  # ログインセッション登録ページ
  def new
  end

  # ログインセッション登録処理
  def create
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

  def destroy
    # user_idのセッション情報のみ削除
    session&.delete(:user_id)
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private
    # ストロングパラメーター（セッションパラメーター取得用）
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
