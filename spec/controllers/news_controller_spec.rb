require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  describe 'GET #index' do
    before do
      3.times do |i|
        create(:news, author: "Author #{i}", title: "Title #{i}", desc: "Desc #{i}", source: "http://example#{i}.com/", tech: 'ruby')
      end
      create(:news, author: "Author 3", title: "Title 3", desc: "Desc 3", source: "http://example3.com/", tech: 'rust')
    end

    let(:latest_news) do
      [
        {
          author: 'Author 3',
          title: 'Title 3',
          desc: 'Desc 3',
          source: 'http://example3.com/',
          tech: 'rust'
        },
        {
          author: 'Author 2',
          title: 'Title 2',
          desc: 'Desc 2',
          source: 'http://example2.com/',
          tech: 'ruby'
        },
        {
          author: 'Author 1',
          title: 'Title 1',
          desc: 'Desc 1',
          source: 'http://example1.com/',
          tech: 'ruby'
        },
        {
          author: 'Author 0',
          title: 'Title 0',
          desc: 'Desc 0',
          source: 'http://example0.com/',
          tech: 'ruby'
        }
      ]
    end

    let(:latest_ruby) do
      [
        {
          author: 'Author 2',
          title: 'Title 2',
          desc: 'Desc 2',
          source: 'http://example2.com/',
          tech: 'ruby'
        },
        {
          author: 'Author 1',
          title: 'Title 1',
          desc: 'Desc 1',
          source: 'http://example1.com/',
          tech: 'ruby'
        },
        {
          author: 'Author 0',
          title: 'Title 0',
          desc: 'Desc 0',
          source: 'http://example0.com/',
          tech: 'ruby'
        }
      ]
    end

    it 'returns latest news' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(latest_news)
    end

    it 'returns latest news by tech' do
      get :index, {key: 'ruby'}
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq(latest_ruby)
    end
  end
end
