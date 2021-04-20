json.array!(@customers) do |customer|
  json.extract! customer, :id, :firstName, :lastName
  json.url customer_url(customer, format: :json)
end
