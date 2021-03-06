# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "changelog/version"

Gem::Specification.new do |s|
  s.name        = "changelog"
  s.version     = Changelog::VERSION
  s.authors     = ["Dwight van Tuyl"]
  s.email       = ["dvantuyl@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Create a Changelog for a project}
  s.description = %q{Uses the project git release tags to output a changelog}

  s.rubyforge_project = "changelog"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rake','~> 0.9.2')
  s.add_dependency('launchy')
  s.add_dependency('methadone')
  s.add_dependency('grit')
  s.add_dependency('redcarpet')
  s.add_dependency('mustache')
end
