# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'overc_wrench/version'

Gem::Specification.new do |spec|
  spec.name          = "overc_wrench"
  spec.version       = OvercWrench::VERSION
  spec.authors       = ["OverC Studios"]
  spec.email         = ["info@overcstudios.com"]
  spec.description   = %q{Rails Utilities}
  spec.summary       = %q{Rails Utilities}
  spec.homepage      = "http://overcstudios.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails", ">= 4.0.0"
end
