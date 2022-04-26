# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  status     :integer          default(0), not null
#  title      :string
#  url        :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
end
