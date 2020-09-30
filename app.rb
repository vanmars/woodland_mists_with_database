require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @stages = Stage.all 
  erb(:stages)
end

get('/stages') do
  @stages = Stage.all 
  erb(:stages)
end