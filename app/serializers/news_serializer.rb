class NewsSerializer < ActiveModel::Serializer
  attributes :author, :title, :desc, :source, :tech
end
