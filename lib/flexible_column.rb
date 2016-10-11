##
# This class represents a column in the table. Instances of this class will get created by FlexibleTable#add_column and used inside an instance of a FlexibleTable.
#
# It's important to note that the width_percentages of all FlexibleColmn's inside an instance of FlexibleTable must add up to less than or equal to 100.
class FlexibleColumn

	# === Attributes
	#
	# * +header+ - A String that will be displayed as the name of the column
	# * +width_percentage+ - An Integer that will be the percentage of the terminal that the column should take up. The total columns width_percentages must add up to less than 100
	# * +justify_header+ - Optional param that takes a symbol (:left or :right) that determines the justification of the column header
	# * +justify_row+ - Optional param that takes a symbol (:left or :right) that determines the justification of the column cells
	def initialize(header, width_percentage, justify_header: :left, justify_row: :left)
		@header            = header
		@width_percentage  = width_percentage
		@justify_header    = justify_header
		@justify_row       = justify_row
	end
	attr_reader :width_percentage, :header, :justify_row, :justify_header
end