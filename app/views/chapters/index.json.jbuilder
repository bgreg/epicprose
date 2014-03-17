json.array!(@chapters) do |chapter|
  json.extract! chapter, :id, :body, :story_id, :user_id
  json.url chapter_url(chapter, format: :json)
end
