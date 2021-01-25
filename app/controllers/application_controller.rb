class ApplicationController < ActionController::Base
  helper_method :current_user,:user_signed_in?
  before_action :login_required, :prepare_rensack

  private
    # ログイン中ユーザー取得メソッド
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    # ユーザーがログインしているか判断するメソッド
    def user_signed_in?
      # current_userがあればログイン済みと判断
      if current_user
        return true
      end
      return false
    end

    # 未ログインユーザーの場合は、アクション前にログイン画面に遷移
    def login_required
      redirect_to login_path unless current_user
    end

    # rensack使用のための@q変数を事前に用意する
    def prepare_rensack
      @q = Petsitter.ransack(params[:q])
    end

end
