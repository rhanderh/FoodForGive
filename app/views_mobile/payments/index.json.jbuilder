json.array!(@payments) do |payment|
  json.extract! payment, :email
  json.url payment_url(payment, format: :json)
end
