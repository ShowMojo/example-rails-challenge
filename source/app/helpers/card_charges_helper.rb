module CardChargesHelper
  def formatted_amount(amount)
    "$ #{'%.2f' % (amount.to_i/100.0)}"
  end
end
