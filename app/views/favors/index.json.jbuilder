json.array!(@favors) do |favor|
  json.extract! favor, :id
  json.url favor_url(favor, format: :json)
end
