# coding: utf-8
require File.expand_path('../lib/accepton/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'accepton'
  spec.version       = AcceptOn::VERSION
  spec.authors       = ['AcceptOn']
  spec.email         = ['developers@accepton.com']

  spec.summary       = "AcceptOn allows you to get paid in your customer's preferred method"
  spec.description   = "AcceptOn allows you to get paid in your customer's preferred method"
  spec.homepage      = "https://accepton.com"
  spec.license       = 'TODO'

  spec.files  = %w[.yardopts README.md Rakefile accepton.gemspec]
  spec.files += Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'hashie', '~> 3.4'
  spec.add_dependency 'http', '~> 0.6.4'

  spec.add_development_dependency 'bundler', '~> 1.8'
end
