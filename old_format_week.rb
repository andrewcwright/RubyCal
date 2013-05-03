 first_day = get_first_day(month, year)
     if week == 1
       week_string = ""
       if first_day === 0 
         blank_spaces = 6 
         dates = 1
       else
         blank_spaces = first_day - 1
         dates = 8 - first_day
       end
       blank_spaces.times { week_string << "   " }
       dates.times { | index | week_string << " #{index + 1} " }
       return week_string.rstrip
     else
       current_day = 2 if first_day == 0
       current_day = 9 - first_day if (1..6).include? first_day
       current_day = current_day + (7 * (week-2))
       if current_day < 10 && current_day <= month_length(month,year)
         week_string << " " + current_day.to_s
         current_day += 1
       elsif current_day <= month_length(month,year)
         week_string << current_day.to_s
         current_day += 1
       end
       last_day_of_week = current_day + 6
       while current_day < last_day_of_week && current_day <= month_length(month, year)
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