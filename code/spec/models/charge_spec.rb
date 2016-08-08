require 'rails_helper'

RSpec.describe Charge, type: :model do

  it { should belong_to :customer }

  it { should validate_presence_of :customer }
  it { should validate_presence_of :currency }
  it { should validate_inclusion_of(:paid).in_array([true, false]) }
  it { should validate_inclusion_of(:refunded).in_array([true, false]) }
end