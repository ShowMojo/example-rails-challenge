require 'rails_helper'

RSpec.describe ChargesController, type: :request do
  describe "#index" do 

    let(:customer1){ Customer.create(first_name: 'Test1', last_name: 'User1') }
    let(:customer2){ Customer.create(first_name: 'Test2', last_name: 'User2') }
    let(:customer3){ Customer.create(first_name: 'Test3', last_name: 'User3') }

    before do 
      # create successful charges
      10.times do 
        CreditCardCharge.create({
          paid: true,
          amount: rand(10000),
          currency: 'USD',
          customer: customer1,
          status: :successful
        })
      end
      # create failed charges
      5.times do 
        CreditCardCharge.create({
          paid: true,
          amount: rand(10000),
          currency: 'USD',
          customer: customer2,
          status: :failed
        })
      end
      # create disputed charges
      5.times do 
        CreditCardCharge.create({
          paid: true,
          amount: rand(10000),
          currency: 'USD',
          customer: customer3,
          status: :disputed
        })
      end

      # goto charges/ path
      get charges_path
    end

    it "should have Failed Charges on page" do 
      expect(response.body).to include('Failed Charges')
    end

    it "should have Disputed Charges on page" do 
      expect(response.body).to include('Disputed Charges')
    end

    it "should have Successful Charges on page" do 
      expect(response.body).to include('Successful Charges')
    end

    it "should contain 10 successful items/charges" do 
      successful_charges = CreditCardCharge.successful
      expect(successful_charges.count).to eq(10)
    end
    
    it "should contain 5 failed items/charges" do 
      failed_charges = CreditCardCharge.failed
      expect(failed_charges.count).to eq(5)
    end

    it "should contain 5 disputed items/charges" do 
      disputed_charges = CreditCardCharge.disputed
      expect(disputed_charges.count).to eq(5)
    end
  end
end
