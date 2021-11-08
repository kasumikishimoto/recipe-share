class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recipes
  has_many :comments
  has_many :likes
  has_many :sns_credentials

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  
  validates :nickname, presence: true

  #SNS認証を行なったことがあるかを判断して、dbに保存する。
  #保存することで、ログインの際にUserモデルとSnsCredentialモデルを紐付ける。
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

  #SNS認証したことがあればアソシエーションで取得
  #無ければemailでユーザー検索して取得 or ビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
  #userが登録済であるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
      user
  end

  # テーブルとのやりとりに関するメソッドはモデルに置く
  def liked_by?(recipe_id)
    likes.where(recipe_id: recipe_id).exists?
  end
end
