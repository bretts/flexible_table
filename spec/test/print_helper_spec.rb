require_relative '../spec_helper'

describe "PrintHelper" do
	include PrintHelper

	describe "#columns_fit_screen?" do
		it "should return false when the total columns width percentages are greater than 100" do
			columns = [FlexibleColumn.new("column_1", 90), FlexibleColumn.new("column_2", 11)]

			columns_fit_screen?(columns).must_equal(false)
		end

		it "should return true when the total columns width percentages are less than 100" do
			columns = [FlexibleColumn.new("column_1", 90), FlexibleColumn.new("column_2", 9)]

			columns_fit_screen?(columns).must_equal(true)
		end

		it "should return true when the total columns width percentages are equal to 100" do
			columns = [FlexibleColumn.new("column_1", 90), FlexibleColumn.new("column_2", 10)]

			columns_fit_screen?(columns).must_equal(true)
		end
	end

	describe "#get_column_width" do
		it "should return the number of columns a column could occupy based on screen size" do
			get_column_width(210, 10).must_equal(21)
		end
	end

	describe "#get_abs_column_width" do
		it "should return the number of columns a column could occupy minus 3 if the result is greater than 0" do
			get_abs_column_width(210, 10).must_equal(18)
		end

		it "should return 1 if the number is less than 1" do
			get_abs_column_width(1, 10).must_equal(1)
		end
	end
end