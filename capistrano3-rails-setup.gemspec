# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
# require 'capistrano/sidekiq/version'

Gem::Specification.new do |spec|
  spec.name = 'capistrano-sidekiq'
  spec.version = Capistrano::Sidekiq::VERSION
  spec.authors = ['Lanvige Jiang']
  spec.email = ['lanvige@gmail.com']
  spec.summary = %q{Prepare for Capistrano 3}
  spec.description = %q{Prepare Rails integration for Capistrano}
  spec.homepage = 'https://github.com/lanvige/capistrano3-rails'
  spec.license = 'MIT'

  spec.required_ruby_version     = '>= 2.2.0'
  spec.files = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano'

end