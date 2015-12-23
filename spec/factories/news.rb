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

FactoryGirl.define do
  factory :news do
    author { FFaker::Name.name }
    sequence(:title) { |n| "Example#{n}" }
    desc { FFaker::Lorem.paragraph }
    source { FFaker::Internet.http_url }
  end
end
