require "rake/testtask"

Rake::TestTask.new do |t|
	t.test_files = FileList['spec/**/*_spec.rb']
end

desc "Demo - Shows some tables being printed"
task :demo do
	require_relative './lib/flexible_table'

	puts "\n\n\n1. Basic Default Table\n\n"
	table = FlexibleTable.new
	table.add_column("Cool Stuff", 15)
	table.add_column("Other Stuff", 15)
	table.add_column("More Stuff", 15)

	table.print_header
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")

	puts "\n\n\n2. Justify Text\n\n"
	table = FlexibleTable.new
	table.add_column("Cool Stuff", 15, justify_header: :right, justify_row: :right)
	table.add_column("Other Stuff", 15, justify_header: :right, justify_row: :right)
	table.add_column("More Stuff", 15, justify_header: :right, justify_row: :right)

	table.print_header
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")

	puts "\n\n\n3. Add Color\n\n"
	using TerminalUtils::Color
	table = FlexibleTable.new
	table.add_column("Cool Stuff".fg_red, 15)
	table.add_column("Other Stuff".fg_green, 15)
	table.add_column("More Stuff".fg_red, 15)

	table.print_header
	table.print_row("im column 1".fg_green, "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2".fg_magenta, "im column 3")
	table.print_row("im column 1".bg_grey, "im column 2", "im column 3".fg_bright_yellow)
end

task default: :test