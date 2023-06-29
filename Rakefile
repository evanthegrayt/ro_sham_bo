# frozen_string_literal: true

require_relative "lib/ro_sham_bo"
require "bundler/gem_tasks"
require "rake/testtask"
require "rdoc/task"

Rake::TestTask.new do |t|
  t.libs = ["lib"]
  t.warning = true
  t.verbose = true
  t.test_files = FileList["test/**/*_test.rb"]
end

# TODO: Add documentation.
# RDoc::Task.new do |rdoc|
#   rdoc.main = 'README.md'
#   rdoc.rdoc_dir = 'doc'
#   rdoc.rdoc_files.include('README.md', 'lib/**/*.rb')
# end

task default: :test
