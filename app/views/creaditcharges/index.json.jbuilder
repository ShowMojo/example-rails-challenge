json.array!(@creaditcharges) do |creaditcharge|
  json.extract! creaditcharge, :id, :paid, :amount, :currency, :refunded
  json.url creaditcharge_url(creaditcharge, format: :json)
end
