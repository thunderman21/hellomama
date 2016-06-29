json.array!(@diary) do |diary|
  json.extract! diary, :id, :post
  json.url diary_url(diary, format: :json)
end