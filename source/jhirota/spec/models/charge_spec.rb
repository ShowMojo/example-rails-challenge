require 'rails_helper'

RSpec.describe Charge, :type => :model do
  it { is_expected.to belong_to(:customer) }
  it { is_expected.to validate_presence_of(:amount) }
end
