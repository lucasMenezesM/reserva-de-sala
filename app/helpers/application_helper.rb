module ApplicationHelper
  def custom_dates
    (Date.today..Date.today + 30).reject { |date| date.saturday? || date.sunday? }
                                 .map { |date| [date.strftime("%d/%m/%Y"), date] }
  end

  def available_months
    today = Date.today
    (0..5).map do |i| 
      month = today.next_month(i) 
      [month.strftime("%B"), month.strftime("%m")]
    end
  end

  def available_days
    today = Date.today
    (0..30).map do |i| 
      day = today.next_day(i) 
      [day.strftime("%d"), day.strftime("%d")]
    end
  end

  def available_hour
    (7..20).map do |number| [number, number] end
  end

  def available_minutes
    (0..59).map {|number| [number, number]}
  end
end
