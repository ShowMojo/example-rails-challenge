require 'test_helper'

class MycustomerTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  	test "should not save customer without first name" do
	  mycustomer = Mycustomer.new
	  assert_not mycustomer.save, "Saved the post without a first name"
	end
end
