require 'rails_helper'

RSpec.feature "Transactions", type: :feature do
    # TODO: move this to fixtures and created as factories.
    # I am running lack of time thus using codes from seed file here.
    before :each do
        SEED_CUSTOMERS = [
            {
                first_name: 'Johny',
                last_name: 'Flow'
            }, {
             first_name: 'Raj',
                last_name: 'Jamnis'
            }, {
                first_name: 'Andrew',
                last_name: 'Chung'
            }, {
                first_name: 'Mike',
                last_name: 'Smith'
            },
        ]
        SEED_CUSTOMERS.each { |data| Customer.create(data) }
        
        5.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.first) }
        3.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.second) }
        1.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.third) }
        1.times { Transaction.create(paid: true, amount: rand(1..100) * 100, customer: Customer.fourth) }
        
        # Failed transactions
        3.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :failed, customer: Customer.third) }
        2.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :failed, customer: Customer.fourth) }
        
        # Disputed transactions
        3.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :disputed, customer: Customer.first) }
        2.times { Transaction.create(paid: true, amount: rand(1..100) * 100, status: :disputed, customer: Customer.second) }
        
        visit(transactions_path)
    end

    it 'should have three lists' do
        expect(page).to have_content 'Failed Charges'
        expect(page).to have_content 'Disputed Charges'
        expect(page).to have_content 'Successful Charges'
    end
    
    it 'should have 10 successful charge items' do
        expect(page).to have_css('.transaction.failed', count: 5)
        expect(page).to have_css('.transaction.disputed', count: 5)
        expect(page).to have_css('.transaction.successful', count: 10)
    end
end
