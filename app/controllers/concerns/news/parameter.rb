module News::Parameter
  extend ActiveSupport::Concern

  private

    def news_params
      params.permit(:key)
    end
end
