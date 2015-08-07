FactoryGirl.define do
  factory :charge do
 		paid 						[true, false].sample
	  amount					{rand(100..10000)}
	  currency				{rand(0..2)}
	  refunded				[true, false].sample
	  customer			  { FactoryGirl.build(:customer) }
  end

  factory :successfull, parent: :charge do
    paid            true
    refunded        false
  end

  factory :failed, parent: :charge do
    paid            false
    refunded        false
  end

  factory :disputed, parent: :charge do
    paid            true
    refunded        true
  end

  factory :customer do
    first_name			{['John', 'Jane', 'Dan', 'Melissa'].sample + rand(1..100).to_s}
    last_name       {['A', 'B', 'C', 'D'].sample + rand(1..100).to_s}
  end
end