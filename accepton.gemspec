# coding: utf-8
require File.expand_path('../lib/accepton/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'accepton'
  spec.version       = AcceptOn::VERSION
  spec.authors       = ['AcceptOn']
  spec.email         = ['developers@accepton.com']

  spec.summary       = 'TODO: Write a short summary, because Rubygems requires one.'
  spec.description   = 'TODO: Write a longer description or delete this line.'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = 'TODO'

  spec.files         = `git ls-files`.split($ORS).reject { |f| f.match(/^(spec)\//) }
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'http', '~> 0.7'

  spec.add_development_dependency 'bundler', '~> 1.8'
end
