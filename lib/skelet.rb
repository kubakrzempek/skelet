require_relative 'skelet/files'

module Skelet
  #main Skelet engine
  class Application
    PERM = 'w+'
    attr_reader :name

    def initialize(name)
      @name=name
    end

    def create_skeleton
      Dir.mkdir(@name)
      Dir.chdir(@name) do
        File.open("#{@name}.gemspec", PERM) {|f| f << Skelet::gemspec(@name)}
        ["bin", "lib", "test", "lib/#{@name}"].each do |entry|
          Dir.mkdir(entry)
        end
        Dir.chdir('test') { File.open("test_#{@name}.rb", PERM) {|f| f << Skelet::test(@name)}}
        Dir.chdir('bin') { File.open(@name, PERM) {|f| f << Skelet::bin(@name)} }
        Dir.chdir("lib") { File.open("#{@name}.rb", PERM) {|f| f << Skelet::main(@name)} }
        Dir.chdir("lib/#{name}") { File.open("version.rb", PERM) {|f| f << Skelet::version(@name) } }
       end
      rescue
         puts "#{@name} folder already exists. Please choose another location or project name"
    end
  end
end
