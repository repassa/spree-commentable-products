# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spree_commentable_products/version"

Gem::Specification.new do |spec|
  spec.name          = "spree_commentable_products"
  spec.version       = SpreeCommentableProducts::VERSION
  spec.authors       = ["Patrick Edgar Müller"]
  spec.email         = ["patrick.e.muller@gmail.com"]
  spec.required_ruby_version = ">= 1.9.3"

  spec.summary       = %q{Adds comments to products#show page on Spree 2.3.1}
  spec.description   = %q{Adds comments to products#show page on Spree 2.3.1}
  spec.homepage      = "https://github.com/repassa/spree_commentable_products"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "spree_core", "2.3.1"
  spec.add_dependency "spree_backend", "2.3.1"
  spec.add_dependency "spree_frontend", "2.3.1"
  spec.add_dependency "acts_as_commentable", "4.0.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
