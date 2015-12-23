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

require 'rails_helper'

RSpec.describe News, type: :model do
  context 'attributes' do
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

    it 'has tech' do
      expect(build(:news, tech: 'ruby')).to have_attributes(tech: 'ruby')
    end
  end

  context 'validations' do
    let(:news) { build(:news) }

    it 'requires title' do
      expect(news).to validate_presence_of(:title)
    end

    it 'requires author' do
      expect(news).to validate_presence_of(:author)
    end

    it 'requires source' do
      expect(news).to validate_presence_of(:source)
    end

    it 'requires tech' do
      expect(news).to validate_presence_of(:tech)
    end

    describe 'requires unique source' do
      it { should validate_uniqueness_of(:source) }
    end

    describe 'requires valid source' do
      it { should allow_value('http://foo.com').for(:source) }
    end

    describe 'requires whitelist of values' do
      it do
        should validate_inclusion_of(:tech).in_array(%w(ruby rust go html css javascript))
      end
    end
  end

  context 'scopes' do
    before do
      (1..15).each do
        tech = ['ruby', 'rust', 'go', 'javascript', 'html', 'css'].sample
        create(:news, tech: tech)
      end
    end

    describe '.latest_by_tech' do
      it 'returns latest news by tech' do
        latest_ruby = News.where(tech: 'ruby').order('created_at desc')
        expect(News.latest_by_tech('ruby')).to match_array latest_ruby
      end
    end

    describe '.latest' do
      it 'returns latest news' do
        latest_new = News.order('created_at desc')
        expect(News.latest).to match_array latest_new
      end
    end
  end
end
