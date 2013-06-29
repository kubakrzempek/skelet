require 'minitest/autorun'
require 'fileutils'
require_relative '../lib/skelet'
include Skelet

class TestSkelet < Minitest::Test
  def setup
    @skelet=Skelet::Application.new("new_gem")
  end
  
  def test_name()
    assert_equal "new_gem", @skelet.name
    assert_respond_to @skelet, :name
    refute_respond_to @skelet, :name=
  end
  
  def test_created_skeleton_tree()
    @skelet.create_skeleton
    assert_equal true, Dir.exist?(@skelet.name)
    
    Dir.chdir(@skelet.name) do
      assert_equal true, File.exist?("#{@skelet.name}.gemspec")
      entries = []
      Dir.entries(Dir.pwd).each do |entry|
        entries << entry unless entry=~/\.{1,2}/
      end
      assert_equal %w[bin lib test].sort, entries.sort
      Dir.chdir("lib") do
        assert_equal true, Dir.exist?(@skelet.name)
        assert_equal true, File.file?("#{@skelet.name}.rb"), 'lib dir'
        Dir.chdir(@skelet.name) do
          assert_equal true, File.file?('version.rb'), "lib/#{@skelet.name} dir"
        end
      end
      Dir.chdir("bin") do
        assert_equal true, File.file?(@skelet.name), 'bin dir'
      end
      Dir.chdir("test") do
        assert_equal true, File.file?("test_#{@skelet.name}.rb"), 'test dir'
      end
    end
  end
    
  def teardown
    #FileUtils.rm_rf(@skelet.name)
  end 
 end
