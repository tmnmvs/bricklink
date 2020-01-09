# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bricklink/version'


Gem::Specification.new do |spec|
  spec.name        = 'bricklink'
  spec.version     = Bricklink::VERSION
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
  spec.platform         = Gem::Platform::RUBY

  spec.add_development_dependency 'bundler','~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'
  spec.add_development_dependency 'byebug', '~> 11.0'
  spec.add_development_dependency 'dotenv', '~> 2.7'
  
  spec.add_dependency 'oauth', '~> 0.5'
end