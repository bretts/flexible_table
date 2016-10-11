require "rake/testtask"

Rake::TestTask.new do |t|
	t.test_files = FileList['spec/**/*_spec.rb']
end

desc "Demo - Shows some tables being printed"
task :demo do
	require_relative './lib/flexible_table'

	puts "\n\n\nExample 1:\n\n"
	table = FlexibleTable.new
	table.add_column("Cool Stuff", 15)
	table.add_column("Other Stuff", 15)
	table.add_column("More Stuff", 15)

	table.print_header
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")

	puts "\n\n\nExample 2:\n\n"
	table = FlexibleTable.new
	table.add_column("Cool Stuff", 15, justify_header: :right, justify_row: :right)
	table.add_column("Other Stuff", 15, justify_header: :right, justify_row: :right)
	table.add_column("More Stuff", 15, justify_header: :right, justify_row: :right)

	table.print_header
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")
	table.print_row("im column 1", "im column 2", "im column 3")
end

task default: :test