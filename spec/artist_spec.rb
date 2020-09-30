require 'rspec'
require 'artist'
require 'stage'
require 'pry'

describe '#Artist' do

  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage = Stage.new("Coloseum", nil)
    @stage.save()
  end

  describe('#==') do
    it("is the same song if it has the same attributes as another song") do
      artist = Artist.new("Chubby Checker", @stage.id, nil)
      artist2 = Artist.new("Chubby Checker", @stage.id, nil)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist = Artist.new("Elvis", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chubby Checker", @stage.id, nil)
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new("Elvis", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chubby Checker", @stage.id, nil)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a artist") do
      artist = Artist.new("Chubby Checker", @stage.id, nil)
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('.find') do
    it("finds a artist by id") do
      artist = Artist.new("Elvis", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chubby Checker", @stage.id, nil)
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new("Chubby Checker", @stage.id, nil)
      artist.save()
      artist.update("Mr. P.C.", @stage.id)
      expect(artist.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new("Elvis", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chubby Checker", @stage.id, nil)
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.find_by_stage') do
    it("finds artists for a stage") do
      stage2 = Stage.new("Blue", nil)
      stage2.save
      artist = Artist.new("Elvis", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("Chubby Checker", stage2.id , nil)
      artist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
    end
  end

end