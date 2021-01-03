class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  # ログインセッション登録ページ
  def new
  end

  # ログインセッション登録処理
  def create
    # SNSログインを使った場合とそうでない場合で条件分岐
    auth = request.env['omniauth.auth']

    if auth.present? # SNSログインありのケース
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      # redirect_back_or user 意味がよくわかっていないため、別の遷移先に一旦する
      redirect_to root_path, notice: "SNSログイン"
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
