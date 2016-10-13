module TerminalUtils
	##
	#
	# This is a refinement on String that adds some properties to the String that represent ANSI Escape Sequences
	#
	# === Examples
	#
	# # Set the String foreground color property to red
	# 'hello'.fg_red.tu_color_prefix
	# => "\e[31m"
	#
	# 'hello'.fg_red.tu_color_suffix
	# => "\e[0m"
	#
	#
	# # Set the background color property to red
	# 'hello'.bg_red.tu_color_prefix
	# => "\e[41m"
	#
	# 'hello'.bg_red.tu_color_suffix
	# => "\e[0m"
	#
	#
	# # Set the foreground to red and the background to black
	# 'hello'.fg_red.bg_black.tu_color_prefix
	# => "\e[31m\e[40m"
	#
	# 'hello'.fg_red.bg_black.tu_color_suffix
	# => "\e[0m"
	module Color
		refine String do
			def fg_default;        return fg_color("\e[39m");  end
			def fg_black;          return fg_color("\e[30m");  end
			def fg_red;            return fg_color("\e[31m");  end
			def fg_green;          return fg_color("\e[32m");  end
			def fg_yellow;         return fg_color("\e[33m");  end
			def fg_blue;           return fg_color("\e[34m");  end
			def fg_magenta;        return fg_color("\e[35m");  end
			def fg_cyan;           return fg_color("\e[36m");  end
			def fg_grey;           return fg_color("\e[37m");  end
			def fg_bright_black;   return fg_color("\e[90m");  end
			def fg_bright_red;     return fg_color("\e[91m");  end
			def fg_bright_green;   return fg_color("\e[92m");  end
			def fg_bright_yellow;  return fg_color("\e[93m");  end
			def fg_bright_blue;    return fg_color("\e[94m");  end
			def fg_bright_magenta; return fg_color("\e[95m");  end
			def fg_bright_cyan;    return fg_color("\e[96m");  end
			def fg_bright_grey;    return fg_color("\e[97m");  end

			def bg_default;        return fg_color("\e[49m");  end
			def bg_black;          return bg_color("\e[40m");  end
			def bg_red;            return bg_color("\e[41m");  end
			def bg_green;          return bg_color("\e[42m");  end
			def bg_yellow;         return bg_color("\e[43m");  end
			def bg_blue;           return bg_color("\e[44m");  end
			def bg_magenta;        return bg_color("\e[45m");  end
			def bg_cyan;           return bg_color("\e[46m");  end
			def bg_grey;           return bg_color("\e[47m");  end
			def bg_bright_black;   return bg_color("\e[100m"); end
			def bg_bright_red;     return bg_color("\e[101m"); end
			def bg_bright_green;   return bg_color("\e[102m"); end
			def bg_bright_yellow;  return bg_color("\e[103m"); end
			def bg_bright_blue;    return bg_color("\e[104m"); end
			def bg_bright_magenta; return bg_color("\e[105m"); end
			def bg_bright_cyan;    return bg_color("\e[106m"); end
			def bg_bright_grey;    return bg_color("\e[107m"); end

			attr_reader :tu_color_prefix, :tu_color_suffix

			private
			def fg_color(ansi_code)
				@tu_fg_color = ansi_code

				return color_string
			end

			def bg_color(ansi_code)
				@tu_bg_color = ansi_code

				return color_string
			end

			def color_string
				@tu_color_prefix = [@tu_fg_color, @tu_bg_color].compact.join('')
				@tu_color_suffix = "\e[0m"

				return self
			end
		end
	end
end