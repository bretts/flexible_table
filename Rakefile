require 'rspec/core/rake_task'
require_relative './lib/flexible_table'

RSpec::Core::RakeTask.new(:test) do |t|
	t.pattern = "spec/test/*_spec.rb"
end

task :default => :test