# Seed 4 Customers into the system:

# Customer 1: 
#   First Name: Johny 
#   Last Name: Flow

# Customer 2: 
#   First Name: Raj
#   Last Name: Jamnis

# Customer 3: 
#   First Name: Andrew
#   Last Name: Chung

# Customer 4: 
#   First Name: Mike
#   Last Name: Smith

# Create Customers
cust_01 = Customer.create(firstname: 'Johny', lastname: 'Flow')
cust_02 = Customer.create(firstname: 'Raj', lastname: 'Jamnis')
cust_03 = Customer.create(firstname: 'Andrew', lastname: 'Chung')
cust_04 = Customer.create(firstname: 'Mike', lastname: 'Smith')

# Seed 20 transactions (charges) into the system:

# 10 Should be successful transactions:
#   - 5 Should be linked to Customer 1
cust_01_charge1 = cust_01.charges.create!(paid: true, amount: 4900, currency: 'usd', refunded: false)
cust_01_charge2 = cust_01.charges.create!(paid: true, amount: 4800, currency: 'usd', refunded: false)
cust_01_charge3 = cust_01.charges.create!(paid: true, amount: 4700, currency: 'usd', refunded: false)
cust_01_charge4 = cust_01.charges.create!(paid: true, amount: 4600, currency: 'usd', refunded: false)
cust_01_charge5 = cust_01.charges.create!(paid: true, amount: 4500, currency: 'usd', refunded: false)
#   - 3 Should be linked to Customer 2
cust_02_charge1 = cust_02.charges.create!(paid: true, amount: 4400, currency: 'usd', refunded: false)
cust_02_charge2 = cust_02.charges.create!(paid: true, amount: 4300, currency: 'usd', refunded: false)
cust_02_charge3 = cust_02.charges.create!(paid: true, amount: 4200, currency: 'usd', refunded: false)
#   - 1 Should be linked to Customer 3
cust_03_charge1 = cust_03.charges.create!(paid: true, amount: 4100, currency: 'usd', refunded: false)
#   - 1 Should be linked to Customer 4
cust_04_charge1 = cust_04.charges.create!(paid: true, amount: 4000, currency: 'usd', refunded: false)

# 5 Should be transactions that failed:
#   - 3 Should be linked to Customer 3
cust_03_charge1 = cust_03.charges.create!(paid: false, amount: 4100, currency: 'usd', refunded: false)
cust_03_charge2 = cust_03.charges.create!(paid: false, amount: 4200, currency: 'usd', refunded: false)
cust_03_charge3 = cust_03.charges.create!(paid: false, amount: 4300, currency: 'usd', refunded: false)
#   - 2 Should be linked to Customer 4
cust_04_charge1 = cust_04.charges.create!(paid: false, amount: 4400, currency: 'usd', refunded: false)
cust_04_charge2 = cust_04.charges.create!(paid: false, amount: 4300, currency: 'usd', refunded: false)

# 5 should be disputed:
#   - 3 should be linked to Customer 1
cust_01_charge1 = cust_01.charges.create!(paid: true, amount: 4100, currency: 'usd', refunded: true)
cust_01_charge2 = cust_01.charges.create!(paid: true, amount: 4200, currency: 'usd', refunded: true)
cust_01_charge3 = cust_01.charges.create!(paid: true, amount: 4300, currency: 'usd', refunded: true)
#   - 2 should be linked to customer 2
cust_02_charge1 = cust_02.charges.create!(paid: true, amount: 4400, currency: 'usd', refunded: true)
cust_02_charge2 = cust_02.charges.create!(paid: true, amount: 4500, currency: 'usd', refunded: true)
