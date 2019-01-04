class HomeController < ApplicationController

  def index
    @successful, @disputed, @failed = Transaction.fetch_all
  end

end
