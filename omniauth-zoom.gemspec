# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-zoom/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Espen Antonsen"]
  gem.email         = ["espen@inspired.no"]
  gem.description   = %q{OmniAuth strategy for Zoom.}
  gem.summary       = %q{OmniAuth strategy for Zoom.}
  gem.homepage      = "https://github.com/espen/omniauth-zoom"
  gem.license = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-zoom"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Zoom::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency "rake"
end