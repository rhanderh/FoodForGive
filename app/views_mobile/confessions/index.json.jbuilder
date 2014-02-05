json.array!(@confessions) do |confession|
  json.extract! confession, :confession_text
  json.url confession_url(confession, format: :json)
end
