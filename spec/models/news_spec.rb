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

require 'rails_helper'

RSpec.describe News, type: :model do

  context "attributes" do
  end

  context "validations" do
  end

end
