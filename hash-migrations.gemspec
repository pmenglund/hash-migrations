# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash/migrations/version'

Gem::Specification.new do |gem|
  gem.name          = "hash-migrations"
  gem.version       = Hash::Migrations::VERSION
  gem.authors       = ["Martin Englund"]
  gem.email         = ["martin@englund.nu"]
  gem.description   = %q{Migrations to manage hashes}
  gem.summary       = %q{Migrations for hashes}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
