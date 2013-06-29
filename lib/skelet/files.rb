module Skelet


  def gemspec(skelet_name)
  
  user_name = `git config user.name`.chomp rescue "TODO"
  user_email = `git config user.email`.chomp rescue "TODO"
    
gemspec_content= <<EOF
#-*- encoding utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "#{skelet_name}/version"

Gem::Specification.new do |s|
  s.name = "#{skelet_name}"
  s.version = #{skelet_name.capitalize}::VERSION
  s.platform = Gem::Platform::Ruby
  s.authors = [#{user_name}]
  s.email = [#{user_email}]
  s.homepage = "TODO"
  s.summary = "TODO"
  s.description = "TODO"
  
  s.files = `git ls-files`.split("\\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\\n")
  s.executables = `git ls-files -- bin/*`.split("\\n").map { |f| File.basename(f)}
  s.require_paths = ["lib"]
end
EOF
  return gemspec_content
  end
  
  
  
  
  def version(skelet_name)
version_content = <<EOF
module #{skelet_name.capitalize}
  VERSION = "0.0.1"
end
EOF
  return version_content
  end 
  
  
  
  
  def bin(skelet_name)
bin_content = <<EOF
#!/usr/bin/env ruby

require '#{skelet_name}'
EOF
  return bin_content
  end
  
  
  def test(skelet_name)
test_content = <<EOF
require 'minitest/autorun'
require_relative '../lib/#{skelet_name}'
include #{skelet_name.capitalize}

class Test#{skelet_name.capitalize} < Minitest::Test
  def setup
  end
  
  def teardown
  end
end
EOF
  return test_content
  end
  
  
  def main(skelet_name)
main_content = <<EOF
module #{skelet_name.capitalize}
end
EOF
  end
end
