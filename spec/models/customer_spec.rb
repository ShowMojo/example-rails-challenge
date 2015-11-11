# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  firstname  :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:credit_card_charges) }
end
