require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a Pry console'
task :console do
  puts "
  
    We Exited and Came Back!
    - Your Varibales from Before DON'T Exist
    - But We Have Our Latest + Gratest Code
  

  "
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
