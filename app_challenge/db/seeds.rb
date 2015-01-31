# 10 Should be successful transactions:
#  - 5 Should be linked to Customer 1
# - 3 Should be linked to Customer 2
# - 1 Should be linked to Customer 3
# - 1 Should be linked to Customer 4
#
# 5 Should be transactions that failed:
#  -  3 Should be linked to Customer 3
# - 2 Should be linked to Customer 4
#
# 5 should be disputed:
#                 - 3 should be linked to Customer 1
# - 2 should be linked to customer 2


# Customer 1:
#     First Name: Johny
# Last Name: Flow
#
#
# Customer 2:
#     First Name: Raj
# Last Name: Jamnis
#
# Customer 3:
#     First Name: Andrew
# Last Name: Chung
#
# Customer 4:
#     First Name: Mike
# Last Name: Smith
#status 1 -successful
#status 2 -failed
#status 3 -disputed

john_data = ['John','Flow',[
    #successful transactions
    [true,100,'usd',false,1],
    [true,120,'usd',false,1],
    [true,210,'usd',false,1],
    [true,13,'usd',false,1],
    [true,10,'usd',false,1],

    #disputed transactions
    [false,130,'usd',false,3,DateTime.now,DateTime.now],
    [false,120,'usd',false,3,DateTime.now,DateTime.now],
    [false,210,'usd',false,3,DateTime.now,DateTime.now]
]
]


raj_data = ['Raj','Jamnis',[
    #successful transactions
    [true,133,'usd',false,1],
    [true,167,'usd',false,1],
    [true,212,'usd',false,1],

    #disputed transactions
    [false,130,'usd',false,3,DateTime.now,DateTime.now],
    [false,120,'usd',false,3,DateTime.now,DateTime.now]

]
]



andru_data = ['Andrew','Chung',[
    #successful transactions
    [true,28,'usd',false,1],

    #failed transactions
    [false,11232,'usd',false,2,DateTime.now,DateTime.now],
    [false,111,'usd',false,2,DateTime.now,DateTime.now],
    [false,12312,'usd',false,2,DateTime.now,DateTime.now]

]
]

mike_data  = ['Mike','Smith',[
    #successful transactions
    [true,2812,'usd',false,1],

    #failed transactions
    [false,33,'usd',false,2,DateTime.now,DateTime.now],
    [false,123,'usd',false,2,DateTime.now,DateTime.now]
] ]

[ john_data,raj_data,andru_data,mike_data].each do |data_tab|

  Customer.create!(
      name: data_tab[0],
      last_name: data_tab[1],
      card_charges: data_tab[2].map do |transaction_row|
        CardCharge.new(
            paid:transaction_row[0],
            amount: transaction_row[1] ,
            currency: transaction_row[2],
            refunded: transaction_row[3],
            status:  transaction_row[4],
            failed_date: (transaction_row[5] if transaction_row[5]),
            dispute_date: (transaction_row[6] if transaction_row[6])
        )
      end)
end




