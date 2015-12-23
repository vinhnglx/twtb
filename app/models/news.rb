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
  validates_format_of :source, with: URI.regexp
  validates_uniqueness_of :source

end
