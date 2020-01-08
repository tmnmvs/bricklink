# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bricklink/version'


Gem::Specification.new do |spec|
  spec.name        = 'bricklink'
  spec.version     = '0.0.1'
  spec.date        = '2020-01-07'
  spec.summary     = "BrickLink API Client"
  spec.description = "Ruby Client for BrickLink API"
  spec.authors     = ["Daryl Winger"]
  spec.email       = 'dbwinger@gmail.com'
  spec.homepage    =
    'https://github.com/dbwinger/bricklink'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler','~> 2.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'dotenv'
  
  spec.add_dependency 'oauth'
end