# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string
#  email            :string           not null
#  salt             :string
#  user_name        :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :user_name, presence: true, length: { maximum: 255 }

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :like_articles, through: :likes, source: :article

  def own?(object)
    id == object.user_id
  end

  def like(article)
    like_articles << article
  end
  
  def unlike(article)
    like_articles.destroy(article)
  end
  
  def like?(article)
    like_articles.include?(article)
  end
end
