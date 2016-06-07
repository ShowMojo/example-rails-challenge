require 'rails_helper'

RSpec.describe Customer, :type => :model do
  it { should have_many :charges }

  context ".full_name" do 
    before do
      @customer = FactoryGirl.create(:customer, fname: 'Johny', lname: 'Jin')
    end

    it 'should be "fname lname".' do
      expect(@customer.full_name).to eq 'Johny Jin'
    end
  end
end
