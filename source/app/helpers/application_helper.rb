module ApplicationHelper

  def friendly_date(date, include_day = true)
    "#{date.strftime("%a") + ', ' if include_day} #{date.strftime("%b")} #{date.day}, #{date.year}" if date
  end
end
