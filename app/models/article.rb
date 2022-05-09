# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  status     :integer          default("everytime"), not null
#  title      :string
#  url        :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Article < ApplicationRecord
  acts_as_taggable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  validates :url, :status, presence: true
  enum status: { everytime: 0, after_study: 1 }

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      article = find_by(id: row["id"]) || new
      binding.pry
      article.attributes = row.to_hash.slice(*updatable_attributes)
      article.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["id", "user_id", "title", "url", "body", "status"]
  end
end
