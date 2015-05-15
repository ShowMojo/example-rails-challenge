customers =YAML::load_file(File.join(Rails.root, 'db', 'customers.yml'))
customers.each do |customer|
  Customer.find_or_create_by customer
end

customers = Customer.all
successful = { paid: true, refunded: false }
failed = { paid: false }
disputed = { paid: true, refunded: true }

5.times { customers[0].charges.create successful.update({ amount: Random.rand(999999) }) }
3.times { customers[1].charges.create successful.update({ amount: Random.rand(999999) }) }
1.times { customers[2].charges.create successful.update({ amount: Random.rand(999999) }) }
1.times { customers[3].charges.create successful.update({ amount: Random.rand(999999) }) }

3.times { customers[2].charges.create failed.update({ amount: Random.rand(999999) }) }
2.times { customers[3].charges.create failed.update({ amount: Random.rand(999999) }) }

3.times { customers[0].charges.create disputed.update({ amount: Random.rand(999999) }) }
2.times { customers[1].charges.create disputed.update({ amount: Random.rand(999999) }) }
