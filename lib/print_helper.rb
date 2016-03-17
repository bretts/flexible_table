module PrintHelper
    private
    def get_abs_width(width_percentage, offset=0)
        abs_width = (Integer(((width_percentage.to_f / 100.to_f) * @screen_width.to_f).floor)) - offset

        return abs_width <= 0 ? 1 : abs_width
    end

    def get_printable_output(str, abs_width)
        return str[0..(abs_width - 1)]
    end

    def print_header_line
        line_header = ''
        
        @columns.each do |col|
            get_abs_width(col.width_percentage).times do |t|
                line_header << '-'
            end
        end
        puts "#{line_header}\n"
    end

    def validate_column_width_percentages
        total_percentage = (@columns.map { |x| x.width_percentage }).reduce(:+)
        if(total_percentage > 100)
            puts "Your column percentages can't add up to more than 100%\n"
            @columns.each { |col| puts "\t#{col.header}: \t#{col.width_percentage}" }
            puts "\tTotal percetage: #{total_percentage}" 
            exit
        end
    end
end