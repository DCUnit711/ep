# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "deprecated"
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Erik Hollensbe"]
  s.date = "2008-07-26"
  s.email = "erik@hollensbe.org"
  s.require_paths = ["lib"]
  s.rubyforge_project = "deprecated"
  s.rubygems_version = "1.8.24"
  s.summary = "An easy way to handle deprecating and conditionally running deprecated code"

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
