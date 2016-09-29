Customer.find_or_create_by!(id: 1, first_name: 'Johny', last_name: 'Flow')
Customer.find_or_create_by!(id: 2, first_name: 'Raj', last_name: 'Jamnis')
Customer.find_or_create_by!(id: 3, first_name: 'Andrew', last_name: 'Chung')
Customer.find_or_create_by!(id: 4, first_name: 'Mike', last_name: 'Smith')

CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 1100, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 1200, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 1300, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 1400, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 1500, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 2100, customer_id: 2)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 2200, customer_id: 2)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 2300, customer_id: 2)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 3100, customer_id: 3)
CreditCardCharge.find_or_create_by!(paid: true, refunded: false, amount: 5100, customer_id: 4)

CreditCardCharge.find_or_create_by!(paid: false, refunded: false, amount: 13100, customer_id: 3)
CreditCardCharge.find_or_create_by!(paid: false, refunded: false, amount: 13200, customer_id: 3)
CreditCardCharge.find_or_create_by!(paid: false, refunded: false, amount: 13300, customer_id: 3)
CreditCardCharge.find_or_create_by!(paid: false, refunded: false, amount: 14100, customer_id: 4)
CreditCardCharge.find_or_create_by!(paid: false, refunded: false, amount: 14200, customer_id: 4)

CreditCardCharge.find_or_create_by!(paid: true, refunded: true, amount: 21100, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: true, amount: 21200, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: true, amount: 21300, customer_id: 1)
CreditCardCharge.find_or_create_by!(paid: true, refunded: true, amount: 22100, customer_id: 2)
CreditCardCharge.find_or_create_by!(paid: true, refunded: true, amount: 22200, customer_id: 2)
