Customer.destroy_all
Charge.destroy_all

customers = ActiveRecord::Base.transaction do
  [
    { f_name: 'Johny', l_name: 'Flow' },
    { f_name: 'Raj', l_name: 'Jamnis' },
    { f_name: 'Andrew', l_name: 'Chung' },
    { f_name: 'Mike', l_name: 'Smith' }
  ].map do |attrs|
    Customer.create!(attrs)
  end
end

ActiveRecord::Base.transaction do
  5.times { Charge.create!(status: :successful, customer_id: customers[0].id, amount_cents: rand(10_000)) }
  3.times { Charge.create!(status: :successful, customer_id: customers[1].id, amount_cents: rand(10_000)) }
  1.times { Charge.create!(status: :successful, customer_id: customers[2].id, amount_cents: rand(10_000)) }
  1.times { Charge.create!(status: :successful, customer_id: customers[3].id, amount_cents: rand(10_000)) }

  3.times { Charge.create!(status: :failed, customer_id: customers[2].id, amount_cents: rand(10_000)) }
  2.times { Charge.create!(status: :failed, customer_id: customers[3].id, amount_cents: rand(10_000)) }

  3.times { Charge.create!(status: :disputed, customer_id: customers[0].id, amount_cents: rand(10_000)) }
  2.times { Charge.create!(status: :disputed, customer_id: customers[1].id, amount_cents: rand(10_000)) }
end
