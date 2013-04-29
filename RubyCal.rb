month = ARGV[0]
year = ARGV[1]

# puts `cal #{month} #{year}`
class Calendar

  def header(month, year)
    return "    January #{year}\n" if month == "1"
    return "   February #{year}\n" if month == "2"
    return "     March #{year}\n" if month == "3"
    return "     April #{year}\n" if month == "4"
    return "      May #{year}\n" if month == "5"
    return "     June #{year}\n" if month == "6"
    return "     July #{year}\n" if month == "7"
    return "    August #{year}\n" if month == "8"
    return "   September #{year}\n" if month == "9"
    return "   October #{year}\n" if month == "10"
    return "   November #{year}\n" if month == "11"
    return "   December #{year}\n" if month == "12"
  end

  def day_header
    return "Su Mo Tu We Th Fr Sa"
  end

  # def first_day_of_month(month, year)
  #   month = month.to_i
  #   year = year.to_i
  #   day_of_the_week = (1 + (13(month) / 5) + )
  # end

  def display(month, year)
    output = ""
    upper_header = header(month, year)
    output << upper_header
    lower_header = day_header()
    output << lower_header
    puts output
  end

end

output = Calendar.new
output.display(month, year)