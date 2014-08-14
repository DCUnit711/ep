#
# Please see the COPYING file in the source distribution for copyright information.
# 

require 'rubygems'
require 'rubygems/package_task'
require 'rake/testtask'
require 'rdoc/task'

$:.unshift 'lib'
require 'deprecated'
$:.shift

task :default => [ :dist ]

#
# Tests
#

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true 
end

#
# Distribution
#

task :dist      => [:test, :repackage, :gem, :rdoc]
task :distclean => [:clobber_package, :clobber_rdoc]
task :clean     => [:distclean]

#
# Documentation
#

RDoc::Task.new do |rd|
  rd.rdoc_dir = "rdoc"
  rd.main = "README"
  rd.rdoc_files.include("README")
  rd.rdoc_files.include("./lib/**/*.rb")
  rd.options = %w(-a)
end

#
# Packaging
# 

spec = Gem::Specification.new do |s|
  s.name = "deprecated"
  s.version = Deprecated::VERSION
  s.author = "Erik Hollensbe"
  s.email = "erik@hollensbe.org"
  s.summary = "An easy way to handle deprecating and conditionally running deprecated code"
  s.has_rdoc = true
  s.files = Dir['Rakefile'] + Dir['lib/deprecated.rb'] + Dir['test/test_deprecated.rb']
  s.test_file = "test/test_deprecated.rb"
  s.rubyforge_project = 'deprecated'
  s.license = "MIT"
  s.add_development_dependency "test-unit", ">= 0"
end

Gem::PackageTask.new(spec) do |p|
  p.need_tar_gz = true
  p.need_zip = true
end
