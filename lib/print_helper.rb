module PrintHelper
	##
	# Returns the width that a column should occupy based on screen size
	#
	# === Attributes
	#
	# +total_screen_columns+ - An Integer representing columns on the terminal window
	# +width_percentage+ - An Integer representing the percentage of the total_screen_columns that the column should occupy
	def get_column_width(total_screen_columns, width_percentage)
		column_width = (Integer(((width_percentage.to_f / 100.to_f) * total_screen_columns.to_f).floor))

		return column_width
	end

	##
	# Returns a slightly truncated version of #get_column_width in order to compensate for different font sizes.
	# This is the method that should be used when calculating what gets printed into a column
	#
	# === Attributes
	#
	# +total_screen_columns+ - An Integer representing columns on the terminal window
	# +width_percentage+ - An Integer representing the percentage of the total_screen_columns that the column should occupy
	def get_abs_column_width(total_screen_columns, width_percentage)
		column_width = get_column_width(total_screen_columns, width_percentage) - 3

		return column_width <= 0 ? 1 : column_width
	end

	def get_printable_output(str, abs_width)
		return str.to_s[0..(abs_width - 1)]
	end

	def print_header_line(total_screen_columns)
		line_header = ''
		separator   = tty_supports_unicode? ? "\u2500" : '-'

		@columns.each do |col|
			get_column_width(total_screen_columns, col.width_percentage).times do |t|
				line_header << separator
			end
		end
		puts "#{line_header}\n"
	end

	def columns_fit_screen?(columns)
		total_percentage = (columns.map { |x| x.width_percentage }).reduce(:+)
		if(total_percentage > 100)
			puts "Your column percentages can't add up to more than 100\n"
			columns.each { |col| puts "\t#{col.header}: \t#{col.width_percentage}" }
			puts "\tTotal percetage: #{total_percentage}"

			return false
		else
			return true
		end
	end

	def print_column_separator
		separator = tty_supports_unicode? ? "\u2502" : '|'

		printf(" #{separator} ")
	end

	private
	def tty_supports_unicode?
		@tty_is_unicode_enabled ||= ENV.values_at("LC_ALL","LC_CTYPE","LANG").compact.any? { |x| x.downcase.include?('utf-8') }

		return @tty_is_unicode_enabled
	end
end