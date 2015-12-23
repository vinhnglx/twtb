# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  author     :string
#  title      :string
#  desc       :text
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ActiveRecord::Base
  # Validation: Listing validations
  #
  validates :author, :title, :desc, :source, presence: true
  validates :source, format: URI.regexp
  validates :source, uniqueness: true
end
