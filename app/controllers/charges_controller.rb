class ChargesController < ApplicationController
  def index
    @page = ChargesIndexPresenter.new
  end
end
