module ChargesHelper
  def display_date(timestamp)
    Time.at(timestamp).strftime('%d/%m/%y')
  end
end
