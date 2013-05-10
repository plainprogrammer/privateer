# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'privateer/version'

Gem::Specification.new do |spec|
  spec.name          = 'privateer'
  spec.version       = Privateer::VERSION
  spec.authors       = ['James Thompson']
  spec.email         = ['james@plainprograms.com']
  spec.description   = %q{A library for writing private apps for Shopify}
  spec.summary       = %q{Privateer provides an interface for integrating private apps with the Shopify API.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.8.7'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 4.7.4'
end
