FactoryBot.define do
  factory :customer do
    first_name { 'Mike' }
    last_name { 'Smith' }

    factory :customer_with_failed_charges do
      transient do
        charges { 1 }
      end

      after :create do |customer, e|
        create_list :failed_charge, e.charges, customer: customer
      end
    end
  end
end
