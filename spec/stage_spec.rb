require 'rspec'
require 'stage'


describe '#Stage' do

  before(:each) do
    Stage.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Stage.all()).to(eq([]))
    end
  end  

  describe('#save') do
    it("saves a stage") do
      lightning_stage = Stage.new("Lightning Stage", nil )
      lightning_stage.save()
      fairyland_stage = Stage.new("Fairyland Stage", nil)
      fairyland_stage.save()
      expect(Stage.all).to(eq([lightning_stage, fairyland_stage]))
    end
  end

  describe('.clear') do
    it("clears all stages") do
      lightning_stage = Stage.new("Lightning Stage", nil )
      lightning_stage.save()
      fairyland_stage = Stage.new("Fairyland Stage", nil)
      fairyland_stage.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end

  describe('.delete') do
    it("deletes a stage by id") do
      lightning_stage = Stage.new("Lightning Stage", nil )
      lightning_stage.save()
      fairyland_stage = Stage.new("Fairyland Stage", nil)
      fairyland_stage.save()
      lightning_stage.delete()
      expect(Stage.all).to(eq([fairyland_stage]))
    end
  end


end