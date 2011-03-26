# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise_loginza/version"

Gem::Specification.new do |s|
  s.name        = "devise_loginza"
  s.version     = DeviseLoginza::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Maxim"]
  s.email       = ["parallel588@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Devise << Loginza}
  s.description = %q{Devise << Loginza}

  s.rubyforge_project = "devise_loginza"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "json",     ">= 1.5.1"
  s.add_dependency "devise"
  s.add_dependency "httparty", ">= 0.7.4"
end
