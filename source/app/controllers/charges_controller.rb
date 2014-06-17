class ChargesController < ApplicationController
  def index
    @charges = { failed: Charge.failed, disputed: Charge.disputed, successful: Charge.successful }
  end
end
