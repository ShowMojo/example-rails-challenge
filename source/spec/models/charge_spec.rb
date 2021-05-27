require 'rails_helper'

RSpec.describe Charge, type: :model do
  it { should belong_to(:customer) }
end
