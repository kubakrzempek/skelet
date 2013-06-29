#-*- encoding utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "new_gem/version"

Gem::Specification.new do |s|
  s.name = "new_gem"
  s.version = New_gem::VERSION
  s.platform = Gem::Platform::Ruby
  s.authors = [Kuba Krzempek]
  s.email = [kubakrzempek@gmail.com]
  s.homepage = "TODO"
  s.summary = "TODO"
  s.description = "TODO"
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f)}
  s.require_paths = ["lib"]
end
