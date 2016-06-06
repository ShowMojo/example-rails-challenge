require 'test_helper'

class ChargesControllerTest < ActionController::TestCase
  setup do
    load "#{Rails.root}/db/seeds.rb"
  end

  test 'should verify charges lists on the screen' do
    get :index
    assert_response :success

    assert_select 'div.list', 3, 'should be 3 lists on the screen'

    assert_select 'div.list.failed', 1, 'just 1 list for failed transactions'
    assert_select 'div.list.disputed', 1, 'just 1 lists for disputed transactions'
    assert_select 'div.list.succeeded', 1, 'just 1 lists for succeeded transactions'

    assert_select 'div.list.succeeded tr', 10, 'should be 10 line items in successful charges list'
    assert_select 'div.list.failed tr', 5, 'should be 5 line items in failed charges list'
    assert_select 'div.list.disputed tr' do |charges|
      assert charges.size > 0, 'in disputed charges list should be some failed charges'
    end
  end

end
