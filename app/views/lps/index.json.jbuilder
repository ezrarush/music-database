json.array!(@lps) do |lp|
  json.extract! lp, :id, :title, :artist, :condition, :type
  json.url lp_url(lp, format: :json)
end
