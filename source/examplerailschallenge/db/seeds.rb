# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

trans = {amount: rand(1000..10000), currency: 'usd'}
a = Customer.create(firstname: 'Johny', lastname: 'Flow')
5.times do
	c = a.charge.build(trans.merge({paid: true, refunded: false}))
	c.save
end
3.times do
	c = a.charge.build(trans.merge({paid: true, refunded: true}))
	c.save
end
a = Customer.create(firstname: 'Raj', lastname: 'Jamnis')
3.times do
	c = a.charge.build(trans.merge({paid: true, refunded: false}))
	c.save
end
2.times do
	c = a.charge.build(trans.merge({paid: true, refunded: true}))
	c.save
end
a = Customer.create(firstname: 'Andrew', lastname: 'Chung')
1.times do
	c = a.charge.build(trans.merge({paid: true, refunded: false}))
	c.save
end
3.times do
	c = a.charge.build(trans.merge({paid: false, refunded: false}))
	c.save
end
a = Customer.create(firstname: 'Mike', lastname: 'Smith')
1.times do
	c = a.charge.build(trans.merge({paid: true, refunded: false}))
	c.save
end
2.times do
	c = a.charge.build(trans.merge({paid: false, refunded: false}))
	c.save
end