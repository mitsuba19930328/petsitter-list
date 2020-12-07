class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # ストロングパラメーターを使用してユーザーインスタンス生成
    user = User.new(user_params)
    if user.save
      # ユーザー登録成功した場合
      redirect_to root_path, notice: "ユーザー登録が完了しました。"
    else
      # ユーザー登録失敗した場合
      render new_user_path, notice: "ユーザー登録が失敗しました。"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to root_path, notice: "ユーザー情報を更新しました"
    else
      render edit_user_path, notice: "ユーザー情報更新に失敗しました"
    end
  end

  def destroy
  end

  private
    # ユーザーのストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :image_name)
    end
end
