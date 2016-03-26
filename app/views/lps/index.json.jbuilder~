json.array!(@albums) do |album|
  json.extract! album, :id, :title, :artist, :condition, :type
  json.url album_url(album, format: :json)
end
