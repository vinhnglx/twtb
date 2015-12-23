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
#  tech       :string
#

class News < ActiveRecord::Base
  # Validation: Listing validations
  #
  validates :author, :title, :desc, :source, :tech, presence: true
  validates :source, format: URI.regexp
  validates :source, uniqueness: true
  validates :tech, inclusion: { in: %w(ruby rust go html css javascript) }

  # Scopes
  #
  scope :latest_by_tech, ->(tech) { where(tech: tech).order('created_at desc') }
end
