class Seeder
  attr_accessor :customers,
                :successful_transactions,
                :failed_transactions,
                :disputed_transactions

  def initialize
    @customers = []
    @successful_transactions = []
    @failed_transactions = []
    @disputed_transactions = []
  end

  def run
    puts "creating customer"
    create_customers

    puts "creating 10 successful transactions"
    create_successful_transactions

    puts "creating 5 failed transactions"
    create_failed_transactions

    puts "creating 5 disputed transactions"
    create_disputed_transactions

    puts "done"
  end

  def create_customers
    customers_object = [
      { first_name: "Johny", last_name: "Flow" },
      { first_name: "Raj", last_name: "Jamnis" },
      { first_name: "Andrew", last_name: "Chung" },
      { first_name: "Mike", last_name: "Smith" },
    ]

    customers = Customer.create customers_object

    @customers = customers
  end

  def create_successful_transactions
    transactions_object = [
      { count: 5, customer: 0 },
      { count: 3, customer: 1 },
      { count: 1, customer: 2 },
      { count: 1, customer: 3 },
    ]

    transactions_object.each do |transaction|
      transaction[:count].times do
        create_transactions(transaction[:customer], :successful)
      end
    end
  end

  def create_failed_transactions
    transactions_object = [
      { count: 3, customer: 2 },
      { count: 2, customer: 3 },
    ]

    transactions_object.each do |transaction|
      transaction[:count].times do
        create_transactions(transaction[:customer], :failed)
      end
    end
  end

  def create_disputed_transactions
    transactions_object = [
      { count: 3, customer: 0 },
      { count: 2, customer: 1 },
    ]

    transactions_object.each do |transaction|
      transaction[:count].times do
        create_transactions(transaction[:customer], :disputed)
      end
    end
  end

  private

  def create_transactions(cust_index, status)
    customer = @customers[cust_index]

    customer_charge = customer.charges.create(
      status: status,
      amount: rand(1_00..9999_00),
      created: rand(360).days.ago
    )

    @successful_transactions << customer_charge if status == :successful
    @failed_transactions << customer_charge if status == :failed
    @disputed_transactions << customer_charge if status == :disputed
  end
end