json.array!(@cds) do |cd|
  json.extract! cd, :id, :title, :artist, :condition, :type
  json.url cd_url(cd, format: :json)
end
