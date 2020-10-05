require 'rspec'
require 'pg'
require 'stage'
require 'artist'
require 'pry'

DB = PG.connect({:dbname => 'music_festival_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stages *;")
    DB.exec("DELETE FROM artists *;")
  end
end