# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_science_theater_3000/version"

Gem::Specification.new do |s|
  s.name        = "data_science_theater_3000"
  s.version     = DataScienceTheater3000::VERSION
  s.authors     = ["Tad Hosford", "Nicholas Fine"]
  s.email       = ["tad@isotope11.com"]
  s.homepage    = "http://www.isotope11.com/blog/data-science-theater-3000-a-ruby-interface-for-data-science-toolkit"
  s.summary     = %q{Ruby interface to Data Science Toolkit.}
  s.description = %q{Ruby interface to issue Data Science Toolkit API calls.}

  s.rubyforge_project = "data_science_theater_3000"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'activesupport', '3.0.3'
  s.add_runtime_dependency 'i18n', '0.4.0'
  s.add_dependency 'curb'
  s.add_dependency 'json'
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "webmock"
  s.add_development_dependency 'ruby-debug19'

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
