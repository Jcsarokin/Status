json.array!(@statis) do |stati|
  json.extract! stati, :id, :description
  json.url stati_url(stati, format: :json)
end
