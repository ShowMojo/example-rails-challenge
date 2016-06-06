class ChargesController < ApplicationController
  def index 
    all = Charge.all
    @charges = {
      succeeded: all.succeeded,
      failed: all.failed,
      disputed: all.disputed
    }
    puts all.size, 'charges size'
  end
end
