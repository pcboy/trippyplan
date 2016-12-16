# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trippyplan/version'

Gem::Specification.new do |spec|
  spec.name          = "trippyplan"
  spec.version       = Trippyplan::VERSION
  spec.authors       = ["David Hagege"]
  spec.email         = ["david.hagege@gmail.com"]

  spec.summary       = %q{trippyplan helps you plan your next trip}
  spec.description   = %q{Trippy plan helps you to plan your next trip by grouping attractions close to each other.}
  spec.homepage      = "https://github.com/pcboy/trippyplan"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rspec", "~> 3.4"

  spec.add_dependency "geocoder", "~> 1.4"
  spec.add_dependency "kmeans-clusterer", "~> 0.11"
  spec.add_dependency "rest-client", "~> 2.0"
  spec.add_dependency "activesupport", "~> 4.2"
  spec.add_dependency "trollop", "~> 2.1"
end
