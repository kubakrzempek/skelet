#-*- encodingL utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "skelet/version"

Gem::Specification.new do |s|
  s.name = "skelet"
  s.version = Skelet::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Kuba Krzempek"]
  s.email = ["kubakrzempek@gmail.com"]
  s.homepage = ""
  s.summary = "Application's skeleton generator"
  s.description = "Simply generates a skeleton for an app"
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f)}
  s.require_paths = ["lib"]
end
