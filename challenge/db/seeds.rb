# Customer 1:
#   First Name: Johny
#   Last Name: Flow
#
# Customer 2:
#   First Name: Raj
#   Last Name: Jamnis
#
# Customer 3:
#   First Name: Andrew
#   Last Name: Chung
#
# Customer 4:
#   First Name: Mike
#   Last Name: Smith

c1 = Customer.create(first_name: 'Johny', last_name: 'Flow')
c2 = Customer.create(first_name: 'Raj', last_name: 'Jamnis')
c3 = Customer.create(first_name: 'Andrew', last_name: 'Chung')
c4 = Customer.create(first_name: 'Mike', last_name: 'Smith')

# Charges

def create_charge(customer=nil, paid=nil, refunded=nil)
  Charge.create(
    customer: customer,
    paid: paid,
    refunded: refunded,
    created: Time.zone.now.to_i,
    amount: rand(10000),
    currency: 'usd'
  )
end

# Successful transactions

5.times { create_charge(c1, true, false) }

3.times { create_charge(c2, true, false) }

create_charge(c3, true, false)

create_charge(c4, true, false)

# Failed transactions

3.times { create_charge(c3, false) }

2.times { create_charge(c4, false) }

# Disputed transactions

3.times { create_charge(c1, true, true) }

2.times { create_charge(c2, true, true) }
