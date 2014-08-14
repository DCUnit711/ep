# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ruby-odbc"
  s.version = "0.99995"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christian Werner"]
  s.date = "2013-03-13"
  s.email = "chw @nospam@ ch-werner.de"
  s.extensions = ["ext/extconf.rb", "ext/utf8/extconf.rb"]
  s.extra_rdoc_files = ["README", "COPYING", "ChangeLog", "GPL", "doc/odbc.html"]
  s.files = ["README", "COPYING", "ChangeLog", "GPL", "doc/odbc.html", "ext/extconf.rb", "ext/utf8/extconf.rb"]
  s.homepage = "http://www.ch-werner.de/rubyodbc"
  s.require_paths = ["lib", "lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "ODBC binding for Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
