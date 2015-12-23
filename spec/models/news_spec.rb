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
    it 'has author' do
      expect(build(:news, author: 'John Doe')).to have_attributes(author: 'John Doe')
    end

    it 'has title' do
      expect(build(:news, title: 'Hello')).to have_attributes(title: 'Hello')
    end

    it 'has description' do
      expect(build(:news, desc: 'Sample description')).to have_attributes(desc: 'Sample description')
    end

    it 'has source' do
      expect(build(:news, source: 'http://google.com')).to have_attributes(source: 'http://google.com')
    end
  end

  context "validations" do
    let(:news) { create(:news) }

    it 'requires title' do
      expect(news).to validate_presence_of(:title)
    end

    it 'requires author' do
      expect(news).to validate_presence_of(:author)
    end

    it 'requires source' do
      expect(news).to validate_presence_of(:source)
    end

    describe 'requires unique source' do
      it { should validate_uniqueness_of(:source) }
    end

    describe 'requires valid source' do
      it { should allow_value('http://foo.com').for(:source) }
    end
  end

end
