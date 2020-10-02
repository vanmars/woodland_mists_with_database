require('sinatra')
require('sinatra/reloader')
require('./lib/stage')
require('./lib/artist')
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

get('/stages/:id') do 
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

get('/stages/:id/artists/:artist_id') do
  @artist = Artist.find(params[:artist_id].to_i())
  erb(:artist)
end

post('/stages/:id/artists') do
   @stage = Stage.find(params[:id].to_i())
   artist = Artist.new(params[:artist_name], @stage.id, nil)
   artist.save()
   erb(:stage)
end

patch('/stages/:id/artists/:artist_id') do
  @stage = Stage.find(params[:id].to_i())
  artist = Artist.find(params[:artist_id].to_i())
  artist.update(params[:name], @stage.id)
  erb(:stage)
end

delete('/stages/:id/artists/:artist_id') do
  artist = Artist.find(params[:artist_id].to_i())
  artist.delete
  @stage = Stage.find(params[:id].to_i())
  erb(:stage)
end