json.array!(@groups) do |forum|
  json.extract! forum, :id, :name, :bio
  json.url forum_url(group, format: :json)
end