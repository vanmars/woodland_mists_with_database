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

get('/stages/new') do
  erb(:new_stage)
end

post('/stages') do
  name = params[:stage_name]
  newStage = Stage.new(name, nil)
  newStage.save()
  @stages = Stage.all()
  erb(:stages)
end