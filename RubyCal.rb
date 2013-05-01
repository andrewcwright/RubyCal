
class Calendar

  def header(month, year)
    return "January #{year}".center(20).rstrip if month == "1"
    return "February #{year}".center(20).rstrip if month == "2"
    return "March #{year}".center(20).rstrip if month == "3"
    return "April #{year}".center(20).rstrip if month == "4"
    return "May #{year}".center(20).rstrip if month == "5"
    return "June #{year}".center(20).rstrip if month == "6"
    return "July #{year}".center(20).rstrip if month == "7"
    return "August #{year}".center(20).rstrip if month == "8"
    return "September #{year}".center(20).rstrip if month == "9"
    return "October #{year}".center(20).rstrip if month == "10"
    return "November #{year}".center(20).rstrip if month == "11"
    return "December #{year}".center(20).rstrip if month == "12"
  end

  def day_header
    "Su Mo Tu We Th Fr Sa"
  end

  def zeller(month, year)
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
        return 28
      else
        return 29
      end
    elsif thirty_day_months.include? month
      return 30
    else
      return 31
    end
  end

  def format_week (month, year, week)
    if week == 1
      return "                   1" if zeller(month, year) == 0
      return " 1  2  3  4  5  6  7" if zeller(month, year) == 1
      return "    1  2  3  4  5  6" if zeller(month, year) == 2
      return "       1  2  3  4  5" if zeller(month, year) == 3
      return "          1  2  3  4" if zeller(month, year) == 4
      return "             1  2  3" if zeller(month, year) == 5
      return "                1  2" if zeller(month, year) == 6
    else
      week_string = ""
      current_day = 2 if zeller(month, year) == 0
      current_day = 8 if zeller(month, year) == 1
      current_day = 7 if zeller(month, year) == 2
      current_day = 6 if zeller(month, year) == 3
      current_day = 5 if zeller(month, year) == 4
      current_day = 4 if zeller(month, year) == 5
      current_day = 3 if zeller(month, year) == 6
      current_day = current_day + (7 * (week-2))
      if current_day < 10 && current_day <= month_length(month,year)
        week_string << " " + current_day.to_s
        current_day += 1
      elsif current_day <= month_length(month,year)
        week_string << current_day.to_s
        current_day += 1
      end
      week_end = current_day + 6
      num_of_days = month_length(month, year)
      while current_day < week_end && current_day <= num_of_days
        if current_day < 10
          week_string << "  " + current_day.to_s
          current_day += 1
        else
          week_string << " " + current_day.to_s
          current_day += 1
        end
      end
      week_string
    end
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
    all_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    current_month = 1
    current_week = 1
    puts "#{year.center(62).rstrip!}\n\n"
    while current_month < 12
      puts "#{all_months[current_month-1].center(20)}  #{all_months[current_month].center(20)}  #{all_months[current_month+1].center(20).rstrip}\n"
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
  output = Calendar.new
  if month and year
    output.format_month(month, year)
  elsif month and year.nil?
    year = month
    output.format_year(year)
  end
end