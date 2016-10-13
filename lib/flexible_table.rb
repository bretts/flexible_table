require_relative './flexible_column'
require_relative './print_helper'
require 'io/console'
require_relative './terminal_utils'

##
# This is the main class for creating Tables. The user can create a series of columns, and the print those columns out.
# See the README for more example usages.
#
# === Examples
#
#  table = FlexibleTable.new
#  table.add_column("I'm the first column", 10)
#  table.add_column("I'm the second column", 10)
#  table.print_header
#  table.print_row("I'll be in column 1", "I'll be in column 2")
#  table.print_row("I'll be in column 1", "I'll be in column 2")
#  table.print_row("I'll be in column 1", "I'll be in column 2")
class FlexibleTable
	include PrintHelper

	def initialize
		@total_screen_columns = IO.console.winsize[1]
		@columns              = []
	end

	def add_column(title, width_percentage, **args)
		@columns << FlexibleColumn.new(title, width_percentage, args)
	end

	def print_header()
		exit unless columns_fit_screen?(@columns)

		@columns.each_with_index do |col, index|
			abs_width    = get_abs_column_width(@total_screen_columns, col.width_percentage)
			color_prefix = col.header.instance_eval { @tu_color_prefix } || ''
			color_suffix = col.header.instance_eval { @tu_color_suffix } || ''
			output       = get_printable_output(col.header, abs_width)

			if(@columns[index].justify_header == :left)
				printf("%s%-#{abs_width}s%s", color_prefix, output, color_suffix)
			elsif(@columns[index].justify_header == :right)
				printf("%s%#{abs_width}s%s", color_prefix, output, color_suffix)
			else
				printf("%s%-#{abs_width}s%s", color_prefix, output, color_suffix) # default to left justify
			end
			print_column_separator unless index == (@columns.length - 1)
		end

		puts "\n"
		print_header_line(@total_screen_columns)
	end

	def print_row(*args)
		exit unless columns_fit_screen?(@columns)

		args.each_with_index do |element, index|
			abs_width    = get_abs_column_width(@total_screen_columns, @columns[index].width_percentage)
			color_prefix = element.instance_eval { @tu_color_prefix } || ''
			color_suffix = element.instance_eval { @tu_color_suffix } || ''
			output       = get_printable_output(element, abs_width)

			if(@columns[index].justify_row == :left)
				printf("%s%-#{abs_width}s%s", color_prefix, output, color_suffix)
			elsif(@columns[index].justify_row == :right)
				printf("%s%#{abs_width}s%s", color_prefix, output, color_suffix)
			else
				printf("%s%-#{abs_width}s%s", color_prefix, output, color_suffix) # default to left justify
			end

			print_column_separator unless index == (@columns.length - 1)
		end
		puts "\n"
	end
end