class ChargePresenter < SimpleDelegator
  def amount
    __getobj__.amount / 100
  end
end
