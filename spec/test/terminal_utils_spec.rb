require_relative '../spec_helper'

describe "TerminalUtils" do
	include TerminalUtils

	describe "Color" do
		using TerminalUtils::Color

		describe "Foreground" do
			it "should add a property on String that returns the ANSI foreground red sequence, and a property that returns the ANSI finish sequence" do
				result = 'hello'.fg_red

				result.must_equal('hello')
				result.length.must_equal(5)

				result.tu_color_prefix.must_equal("\e[31m")
				result.tu_color_suffix.must_equal("\e[0m")
			end
		end

		describe "Background" do
			it "should set the background to red with #bg_red" do
				result = "hello".bg_red

				result.must_equal('hello')
				result.length.must_equal(5)

				result.tu_color_prefix.must_equal("\e[41m")
				result.tu_color_suffix.must_equal("\e[0m")
			end
		end

		describe "Chained" do
			it "should set the foreground to green and the background to black by chaining the methods" do
				result = "hello".fg_green.bg_black

				result.must_equal('hello')
				result.length.must_equal(5)

				result.tu_color_prefix.must_equal("\e[32m\e[40m")
				result.tu_color_suffix.must_equal("\e[0m")
			end
		end
	end
end