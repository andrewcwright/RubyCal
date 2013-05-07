
class Calendar
  MONTHS = %w{January February March April May June July August September October November December}
  DAYHEADER = "Su Mo Tu We Th Fr Sa"

  def initialize(month, year)
    if month.nil? && year.nil?
      month = (`date "+%B"`).chomp
      year = (`date "+%Y"`).chomp
    end
    month = (MONTHS.index(month) + 1).to_s if MONTHS.include?(month)
    if month and year
      abort ("#{ month } is neither a month number (1..12) nor a name") unless (1..12).include? (month.to_i)
      abort ("#{ year } is not a number between (1800..3000)") unless (1800..3000).include? (year.to_i)
      print_month(month, year)
    elsif month and year.nil?
      year = month
      abort ("#{ year } is not a number between (1800..3000)") unless (1800..3000).include? (year.to_i)
      print_year(year)
    end
  end

  def header(month, year)
    this_month = MONTHS[month.to_i - 1]
    "#{ this_month } #{ year }".center(20).rstrip
  end

  def get_first_day(month, year)
    year = year.to_i
    month = month.to_i
    q = 1
    offset_months = [13,14]
    y = (month == 1 or month == 2) ? year - 1 : year
    m = (month == 1 or month == 2) ? offset_months[month - 1] : month
    h = (q + (((m + 1) * 26) / 10) + y + (y / 4) + (6 * (y / 100)) + (y / 400)) % 7
    h = h == 0 ? 6 : h - 1 # Makes h zero index to Sunday.
  end

  def month_length(month, year)
    thirty_day_months = [4, 6, 9, 11]
    if month == 2
      return 28 if (year % 4 != 0) or ((year % 100 == 0) and (year % 400 != 0))
      return 29
    end
    (thirty_day_months.include? month) ? 30 : 31
  end

  def format_week(month, year, week)
    first_day = get_first_day(month, year)
    first_week_days = 7 - first_day
    week_string = ""
    if week == 1
      week_string << format_first_week(month, year, week)
    else
      current_day = first_week_days + 1 + (7 * (week - 2))
      7.times do
        week_string << " #{current_day} " if current_day < 10
        if current_day <= month_length(month, year) and current_day >= 10
          week_string << "#{current_day} "
        end
        current_day += 1
      end
    end
    week_string.rstrip
  end

  def format_first_week(month, year, week)
    week_string = ""
    first_day = get_first_day(month, year)
    days_in_week = 7 - first_day
    days_in_week.times { |day| week_string << " #{day + 1} "}
    week_string.rstrip.rjust(20)
  end

  def print_month(month, year)
    puts "#{header(month, year)}\n"
    puts "#{DAYHEADER}\n"
    current_week = 1
    while current_week <= 6
      puts "#{format_week(month.to_i, year.to_i, current_week)}\n"
      current_week += 1
    end
  end

  def print_year(year)
    current_month = 1
    puts "#{year.center(62).rstrip!}\n\n"
    while current_month < 12
      month_header = ""
      month_header << "#{MONTHS[current_month-1].center(20)}  "
      month_header << "#{MONTHS[current_month].center(20)}  "
      month_header << "#{MONTHS[current_month+1].center(20).rstrip}\n"
      puts month_header
      puts "#{DAYHEADER}  #{DAYHEADER}  #{DAYHEADER}\n"
      format_3_week_line(current_month, year)
      current_month += 3
    end
  end

  def format_3_week_line(current_month, year)
    6.times do |current_week|
      date_line = ""
      date_line << "#{format_week(current_month, year.to_i, current_week + 1)}"
      date_line << last_week_buffer(current_month, year.to_i, current_week + 1)
      date_line << "#{format_week(current_month + 1, year.to_i, current_week + 1)}"
      date_line << last_week_buffer(current_month + 1, year.to_i, current_week + 1)
      date_line << "#{format_week(current_month + 2, year.to_i, current_week + 1)}"
      puts date_line
    end
  end

  def last_week_buffer(month, year, week)
    num_spaces = 20 - format_week(month, year.to_i, week).length
    buffer_string = "  "
    num_spaces.times {buffer_string << " "}
    buffer_string
  end

end

if __FILE__ == $0
  month = ARGV[0]
  year = ARGV[1]
  cal = Calendar.new(month, year)
end