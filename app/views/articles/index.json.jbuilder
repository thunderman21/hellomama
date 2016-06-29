json.array!(@articles) do |article|
  json.extract! article, :id, :post
  json.url article_url(article, format: :json)
end
