class User < ApplicationRecord
  # 書く順番
  # ①アソシエーション（belongs_toなど）
  # ②gemなどの関数や他の定義
  # ③AttributeMethodsモジュール
  # ④attr関連
  # ⑤バリデーション
  # ⑥コールバック

  # bcryptによるパスワード検証
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # email用の正規表現
  validates :name, { presence: true, length: { maximum: 30 }}
  validate :validate_name_not_including_comma
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  # email保存前に小文字に変換処理を行う
  before_save { self.email = email.downcase }

  private
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end

end
