# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'positron/version'

Gem::Specification.new do |spec|
  spec.name          = "positron"
  spec.version       = Positron::VERSION
  spec.authors       = ["Marnen Laibow-Koser"]
  spec.email         = ["marnen@marnen.org"]
  spec.description   = %q{Don't leak ActiveRecord details into your Rails models!}
  spec.summary       = %q{Get ActiveRecord persistence out of your public model interface}
  spec.homepage      = "http://www.github.com/marnen/positron"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency 'codeclimate-test-reporter'
end
