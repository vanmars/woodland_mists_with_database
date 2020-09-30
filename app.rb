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

post('/stages') do
  name = params[:stage_name]
  newStage = Stage.new(name, nil)
  newStage.save()
  @stages = Stage.all()
  erb(:stages)
end

get('/stages/new') do
  erb(:new_stage)
end

get('/stages/:id') do   # pass an argument into the url
  @stage = Stage.find(params[:id].to_i)
  erb(:stage)
end

get('/stages/:id/edit') do
  @stage = Stage.find(params[:id].to_i)
  erb(:stage_edit)
end

patch('/stages/:id') do
  @stage = Stage.find(params[:id].to_i)
  @stage.update(params[:name])
  @stages = Stage.all
  erb(:stages)
end

delete('/stages/:id') do
  @stage = Stage.find(params[:id].to_i)
  @stage.delete()
  @stages = Stage.all
  erb(:stages)
end