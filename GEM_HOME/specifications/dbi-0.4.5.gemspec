# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dbi"
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Erik Hollensbe", "Christopher Maujean"]
  s.date = "2010-05-16"
  s.description = "A vendor independent interface for accessing databases, similar to Perl's DBI"
  s.email = "ruby-dbi-users@rubyforge.org"
  s.executables = ["dbi", "test_broken_dbi"]
  s.extra_rdoc_files = ["README", "LICENSE", "ChangeLog"]
  s.files = ["bin/dbi", "bin/test_broken_dbi", "README", "LICENSE", "ChangeLog"]
  s.homepage = "http://www.rubyforge.org/projects/ruby-dbi"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.0")
  s.rubyforge_project = "ruby-dbi"
  s.rubygems_version = "1.8.24"
  s.summary = "A vendor independent interface for accessing databases, similar to Perl's DBI"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<deprecated>, ["= 2.0.1"])
    else
      s.add_dependency(%q<deprecated>, ["= 2.0.1"])
    end
  else
    s.add_dependency(%q<deprecated>, ["= 2.0.1"])
  end
end
