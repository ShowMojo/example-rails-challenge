module ApplicationHelper
  def format_full_name(person)
    "#{person.first_name} #{person.last_name}" 
  end

  def epoch_to_date(epoch)
    Time.at(epoch)
  end
end
