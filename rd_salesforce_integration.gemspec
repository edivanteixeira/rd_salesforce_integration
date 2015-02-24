# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rd_salesforce_integration/version'

Gem::Specification.new do |spec|
  spec.name          = "rd_salesforce_integration"
  spec.version       = RdSalesforceIntegration::VERSION
  spec.authors       = ["Edivan Teixeira"]
  spec.email         = ["edivanteixeira@gmail.com"]

 

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  #dependencies
  spec.add_dependency "restforce"
  spec.add_dependency "activerecord"
  
  #end dependencies
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "sqlite3-ruby"
  spec.add_development_dependency "debugger"
  
  
end
