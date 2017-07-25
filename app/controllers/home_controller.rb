class HomeController < ApplicationController
  def index
  	@charges1 = Charge.list1
  	@charges2 = Charge.list2
  	@charges3 = Charge.list3
  end
end
