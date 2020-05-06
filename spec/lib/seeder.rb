require 'spec_helper'

describe Seeder do
  subject { Seeder.new }

  it 'creates 4 customers' do
    expect { subject.create_customers }
      .to change {4}
      .by(subject.customers.count)
  end

  it 'creates 10 successful transactions' do
    subject.create_customers

    expect { subject.create_successful_transactions }
      .to change {10}
      .by(subject.successful_transactions.count)
  end

  it 'creates 5 failed transactions' do
    subject.create_customers

    expect { subject.create_failed_transactions }
      .to change {5}
      .by(subject.failed_transactions.count)
  end

  it 'creates 5 disputed transactions' do
    subject.create_customers

    expect { subject.create_disputed_transactions }
      .to change {5}
      .by(subject.disputed_transactions.count)
  end
end