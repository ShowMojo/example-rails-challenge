require 'rails_helper'

describe 'ChargesLists' do
  it 'should have 3 tables' do
    visit charges_path

    expect(page).to have_css('table', count: 3)
  end

  it 'should have 10 successful charges' do
    10.times { create :charge, :successful }

    visit charges_path

    expect(page).to have_css('tbody tr[class=""]', count: 10)
  end

  it 'should have 5 failed charges' do
    5.times { create :charge, :failed }

    visit charges_path

    expect(page).to have_css('tr.failed', count: 5)
  end

  it 'should have disputed charges' do
    2.times { create :charge, :disputed }

    visit charges_path

    expect(page).to have_css('tr.disputed')
  end

end
