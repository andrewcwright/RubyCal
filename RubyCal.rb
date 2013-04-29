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
    "Su Mo Tu We Th Fr Sa\n"
  end

  def zeller(month, year)
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

  def display(month, year)
    output = ""
    upper_header = header(month, year)
    output << upper_header
    lower_header = day_header()
    output << lower_header
    puts output
  end

end

# output = Calendar.new
# output.display(month, year)