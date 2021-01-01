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

  before_save :validate_duplicate_review_by_same_user


  private
    # 一人のユーザーから、同じペットシッターへのレビューセーブはエラーにする
    # TODO テストをする必要あり（テスト未作成）
    def validate_duplicate_review_by_same_user
      errors.add('同じペットシッターへの2回以上のレビューはできません。') if Review.find_by(user_id: self.user_id, petsitter_id: self.petsitter_id)
    end
end
