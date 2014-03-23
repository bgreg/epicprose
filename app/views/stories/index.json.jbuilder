json.array!(@stories) do |story|
  json.extract! story, :id, :title, :picture_url, :user_id, :genre_id
  json.url story_url(story, format: :json)
end
