# import module
require 'date'

# user-defined class 
class Calendar
 
    # Intialization
    def initialize(year, start)      
        @day_week = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        @end_month = [ 31,28,31,30,31,30,31,31,30,31,30,31 ]
        @cal = Date.new(year);
        @start = start 
        @year = year
    end

    # Display the day of the weeks and dates. Also calulate the start point of month.
    def DrawMonth(month, start)

        # Display the day of the weeks.
        for day_week in @day_week
            printf("%7s", day_week)
        end
        puts ''
        
        # calulate the start point of month.
        for j in 1..@start
            printf("%7s", " ");
        end
        
        # Display dates
        for j in 1..@end_month[month]
            printf("%7d", j);
            @start += 1
            
            if @start == 7
                @start = 0
                puts ''
            end
         end

         # Move on to next month.
         @cal += j;
         printf("\n\n");
    end

    # Display the calendar.
    def Display()

        # Check the leap Year and modified the Feb's last day.
        if Date.julian_leap?(@year)
            @end_month[1] = 29   
        end

        i = 0
        while i < 12
            # Display the months and Year.
            printf("%27s%7d\n", @cal.strftime('%B').to_s, @year);
            printf("%49s\n", "---------------------------------------------");
            
            # Method call
            DrawMonth(i, @start)
            i += 1;
        end
    end
end

# User input
print "Enter a year: "
year = gets.to_i

print "Enter the first day of the year (enter 1 for Mon, 2 for Tue, etc.): "
start = gets.to_i

cal = Calendar.new(year, start)
print cal.Display()