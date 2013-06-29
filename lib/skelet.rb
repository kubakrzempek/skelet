module Skelet
  class Application
  
    PERM = 'w+'
    
    attr_reader :name
  
    def initialize(name)
      @name=name
    end
  
    def create_skeleton
      ["bin", "lib", "test", "lib/#{@name}"].each do |entry|
        Dir.mkdir(entry)
      end
      Dir.chdir('test') { File.new("test_#{@name}.rb", PERM) }
      Dir.chdir('bin') { File.new(@name, PERM) }
      Dir.chdir("lib") { File.new("#{@name}.rb", PERM) }
      Dir.chdir("lib/#{name}") { File.new("version.rb", PERM) }
    end
  end  
end