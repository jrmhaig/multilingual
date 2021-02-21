# frozen_string_literal: true

require_relative 'lib/multilingual/version'

Gem::Specification.new do |spec|
  spec.name        = 'multilingual'
  spec.version     = Multilingual::VERSION
  spec.authors     = ['Joe Haig']
  spec.email       = ['josephhaig@gmail.com']
  spec.homepage    = 'https://github.com/jrmhaig/multilingual'
  spec.summary     = 'Multilingual support for Active Record fields.'
  spec.description = 'Multilingual support for Active Record fields.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jrmhaig/multilingual'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 6.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec-rails', '~> 4.0'
  spec.add_development_dependency 'rubocop-rails', '~> 2.9'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.2'
  spec.add_development_dependency 'shoulda-matchers', '~> 4.5'
  spec.add_development_dependency 'sqlite3', '~> 1.4.2'
end
