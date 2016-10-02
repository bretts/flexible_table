require_relative './flexible_column'
require_relative './print_helper'
require 'io/console'

class FlexibleTable
    include PrintHelper

    def initialize
        @screen_width = IO.console.winsize[1]
        @columns      = []
    end

    def add_column(title, width_percentage, **args)
        @columns << FlexibleColumn.new(title, width_percentage, args)
    end

    def print_header()
        validate_column_width_percentages

        @columns.each_with_index do |col, index|
            abs_width = get_abs_width(col.width_percentage, 3)
            output    = get_printable_output(col.header, abs_width)

            if(@columns[index].justify_header == :left)
                printf("%-#{abs_width}s", output)
            elsif(@columns[index].justify_header == :right)
                printf("%#{abs_width}s", output)
            else
                printf("%-#{abs_width}s", output) # default to left justify
            end
            printf(' | ') unless index == (@columns.length - 1)
        end

        puts "\n"
        print_header_line
    end

    def print_row(*args)
        validate_column_width_percentages

        args.each_with_index do |element, index|
            abs_width = get_abs_width(@columns[index].width_percentage, 3)
            output    = get_printable_output(element, abs_width)

            if(@columns[index].justify_row == :left)
                printf("%-#{abs_width}s", output)
            elsif(@columns[index].justify_row == :right)
                printf("%#{abs_width}s", output)
            else
                printf("%-#{abs_width}s", output) # default to left justify
            end

            printf(' | ') unless index == (@columns.length - 1)
        end
        puts "\n"
    end
end