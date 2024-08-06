# frozen_string_literal: true

require_relative "lib/service_object/version"

Gem::Specification.new do |spec|
  spec.name = "service_object"
  spec.version = ServiceObject::VERSION
  spec.authors = ["Ale Miralles"]
  spec.email = ["alemiralles@hey.com"]

  spec.summary = "A base class for service objects in Ruby on Rails"
  spec.description = "This gem provides a base class to help you structure service objects in Ruby on Rails apps."
  spec.homepage = "https://github.com/amiralles/service_object"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/amiralles/service_object"

  spec.files = Dir["lib/**/*.rb"] + ["README.md"]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
