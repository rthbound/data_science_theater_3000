# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_science_theater_3000/version"

Gem::Specification.new do |s|
  s.name        = "data_science_theater_3000"
  s.version     = DataScienceTheater3000::VERSION
  s.authors     = ["Tad Hosford"]
  s.email       = ["tad@isotope11.com"]
  s.homepage    = "http://github.com/rthbound/data_science_theater_3000"
  s.summary     = %q{Ruby interface to Data Science Toolkit.}
  s.description = %q{Ruby interface to issue Data Science Toolkit API calls.}

  s.rubyforge_project = "data_science_theater_3000"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'curb'

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
