module ChargesHelper
  def prepare_display_date timestamp
    DateTime.strptime(timestamp.to_s,"%s").to_formatted_s(:long)
  end
end
