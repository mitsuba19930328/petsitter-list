class Review < ApplicationRecord
  # 書く順番
  # ①アソシエーション（belongs_toなど）
  # ②gemなどの関数や他の定義
  # ③AttributeMethodsモジュール
  # ④attr関連
  # ⑤バリデーション
  # ⑥コールバック

  belongs_to :user
  belongs_to :petsitter

  validates :petsitter_id, uniqueness: true
  # before_create :validate_duplicate_review_by_same_user if Review.find_by(user_id: current_user.id, petsitter_id: session[:petsitter_id])


  private
    # 一人のユーザーから、同じペットシッターへのレビューセーブはエラーにする
    # TODO テストをする必要あり（テスト未作成）
    def validate_duplicate_review_by_same_user
      errors.add('同じペットシッターへの2回以上のレビューはできません。')
    end
end
