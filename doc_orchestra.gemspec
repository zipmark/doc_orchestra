# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doc_orchestra/version'

Gem::Specification.new do |spec|
  spec.name          = "doc_orchestra"
  spec.version       = DocOrchestra::VERSION
  spec.authors       = ["Alexandre de Oliveira"]
  spec.email         = ["chavedomundo@gmail.com"]

  spec.summary       = "Orchestrate document generation and publication."
  spec.description   = "This gem manages generating documents, testing them against real endpoints, publishing them and consuming."
  spec.homepage      = "https://github.com/zipmark/doc_orchestra"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
end
