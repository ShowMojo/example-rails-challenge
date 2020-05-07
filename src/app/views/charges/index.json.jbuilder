json.array! @charges do |charge|
  json.id charge.id
  json.customer_id charge.customer_id
  json.amount charge.amount
  json.currency charge.currency.downcase
  json.paid charge.paid
  json.refunded charge.refunded
  json.created charge.created_at.to_i
end
