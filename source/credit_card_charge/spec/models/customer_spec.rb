require 'rails_helper'

describe Customer, 'validations', type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name)  }
end

describe Customer, 'associations', type: :model do
  it { is_expected.to have_many(:charges) }
end

