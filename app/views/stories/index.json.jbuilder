json.array!(@stories) do |story|
  json.extract! story, :id, :title, :picture_url, :genre_id, :user_id
  json.url story_url(story, format: :json)
end
