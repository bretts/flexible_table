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
end