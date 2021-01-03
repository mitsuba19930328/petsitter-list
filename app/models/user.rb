class User < ApplicationRecord
  # 書く順番
  # ①アソシエーション（belongs_toなど）
  # ②gemなどの関数や他の定義
  # ③AttributeMethodsモジュール
  # ④attr関連
  # ⑤バリデーション
  # ⑥コールバック

  # 関連付け
  has_many :reviews, dependent: :destroy
  has_many :petsitters, through: :reviews

  # bcryptによるパスワード検証
  has_secure_password
  # 画像投稿用（carrierwave使用）
  mount_uploader :image, ImageUploader

  # email用の正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validation
  # unless: :uid?はSNSログインの有無（uidありの場合は通常のログインとは異なるため、validationも変更させています）
  validates :name, { presence: true, length: { maximum: 30 }} unless :uid?
  validate :validate_name_not_including_comma
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }} unless :uid?
  validates :password, presence: true unless :uid?
  validates :password_digest, presence: true unless :uid?

  # email保存前に小文字に変換処理を行う
  before_save { self.email = email.downcase }

  #auth hashからユーザ情報を取得
  #データベースにユーザが存在するならユーザ取得して情報更新する；存在しないなら新しいユーザを作成する
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image = auth[:info][:image]
    #必要に応じて情報追加してください

    #ユーザはSNSで登録情報を変更するかもしれので、毎回データベースの情報も更新する
    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image = image
    end
  end

  private
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end

end
