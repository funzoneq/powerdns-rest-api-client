require 'rubocop/rake_task'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby) do |t|
    t.options = ['-D']
  end
end

desc 'Run all style checks'
task style: ['style:ruby']

# Test Kitchen on Jenkins is still TODO
desc 'Run all tests on CI platform'
task test: %w(style)

# The default rake task should just run it all
desc 'Run all tests'
task default: %w(style)
