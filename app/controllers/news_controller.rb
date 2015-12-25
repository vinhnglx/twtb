class NewsController < ApplicationController
  include ::News::Parameter

  def index
    if news_params.present?
      results = News.latest_by_tech(news_params[:key])
    else
      results = News.latest
    end
    render json: results, root:false, each_serializer: ::NewsSerializer
  end
end
