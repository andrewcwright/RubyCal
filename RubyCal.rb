
class Calendar
  MONTHS = %w{January February March April May June July August September October November December}

  def header(month, year)
    this_month = MONTHS[month.to_i - 1]
    "#{this_month} #{year}".center(20).rstrip
  end

  def day_header
    "Su Mo Tu We Th Fr Sa"
  end

  def get_first_day(month, year)
    # return 0:Sat 1:Sun 2:Mon, 3:Tues, 4:Wed, 5:Thurs, 6:Fri
    year = year.to_i
    month = month.to_i
    q = 1
    offset_months = [13,14]
    if month == 1 or month == 2
      y = (year - 1)
      m = offset_months[month - 1]
    else
      y = year
      m = month
    end
    h = (q + (((m + 1) * 26) / 10).floor + y + (y / 4).floor + (6 * (y / 100).floor) + (y / 400).floor) % 7
  end

  def month_length(month, year)
    thirty_day_months = [4, 6, 9, 11]
    if month == 2
      if (year % 4 != 0) or ((year % 100 == 0) and (year % 400 != 0))
        28
      else
        29
      end
    elsif thirty_day_months.include? month
      30
    else
      31
    end
  end

  def format_week (month, year, week)
    first_day = get_first_day(month, year)
    week_string, dates, current_day = "", 0, 0
    if first_day === 0 
      if week === 1
        blank_spaces = 6 
        dates = 1 
      else
        current_day = 2 
      end
    else
      if week === 1
       blank_spaces = first_day - 1
       dates = 8 - first_day
      elsif (1..6).include?(first_day)
        current_day = (9 - first_day)
      end
    end

    current_day = current_day + (7 * (week-2))
    blank_spaces.times { week_string << "   " } if week === 1

    dates = 7 if week > 1

    dates.times do | index | 
      if week == 1
        week_string << " #{index + 1} " 
      else
        week_string << " #{current_day} " if current_day < 10 
        week_string << "#{current_day} " if current_day <= month_length(month, year) && current_day >= 10
        current_day += 1
      end
    end
    week_string.rstrip
  end


  def format_month(month, year)
    puts "#{header(month, year)}\n"
    puts "#{day_header()}\n"
    current_week = 1
    while current_week <= 6
      puts "#{format_week(month.to_i, year.to_i, current_week)}\n"
      current_week += 1
    end
  end

  def format_year (year)
    current_month = 1
    current_week = 1
    puts "#{year.center(62).rstrip!}\n\n"
    while current_month < 12
      puts "#{MONTHS[current_month-1].center(20)}  #{MONTHS[current_month].center(20)}  #{MONTHS[current_month+1].center(20).rstrip}\n"
      puts "#{day_header}  #{day_header}  #{day_header}\n"
      while current_week <= 6
        first_num_spaces = 20 - format_week(current_month, year.to_i, current_week).length
        first_spaces = "  "
        first_num_spaces.times {first_spaces << " "}
        second_num_spaces = 20 - format_week(current_month+1, year.to_i, current_week).length
        second_spaces = "  "
        second_num_spaces.times {second_spaces << " "}
        date_line = ""
        date_line << "#{format_week(current_month, year.to_i, current_week)}" + first_spaces
        date_line << "#{format_week(current_month+1, year.to_i, current_week)}" + second_spaces
        date_line << "#{format_week(current_month+2, year.to_i, current_week)}"
        puts date_line
        current_week += 1
      end
      current_month += 3
      current_week = 1
    end
  end

end

if __FILE__ == $0
  month = ARGV[0]
  year = ARGV[1]
  cal = Calendar.new
  all_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  if month.nil? && year.nil?
    month = (`date "+%B"`).chomp
    year = (`date "+%Y"`).chomp
  end
  if all_months.include?(month)
    month = (all_months.index(month) + 1).to_s
  end
  if month and year
    cal.format_month(month, year)
  elsif month and year.nil?
    year = month
    cal.format_year(year)
  end
end