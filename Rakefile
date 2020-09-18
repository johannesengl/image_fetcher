# frozen_string_literal: true

require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'

Rake::RDocTask.new do |rd|
  rd.main = 'README.rdoc'
  rd.rdoc_files.include('README.rdoc', 'lib/**/*.rb', 'bin/**/*')
  rd.title = 'Your application title'
end

spec = eval(File.read('image-fetcher.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end
