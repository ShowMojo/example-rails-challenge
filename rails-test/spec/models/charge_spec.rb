require 'rails_helper'

RSpec.describe Charge, type: :model do
  it {should validate_presence_of(:customer)}
  it {should validate_presence_of(:amount)}
  it {should belong_to(:customer) }

end
