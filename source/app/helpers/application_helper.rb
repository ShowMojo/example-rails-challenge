# frozen_string_literal: true

# Commonly used application helper methods
module ApplicationHelper
  def custom_datetime(datetime)
    datetime.strftime('%B %e, %Y %I:%S %p')
  end
end
