class Stage
  attr_reader :name, :id

  @@stages = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  # For Testing
  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

   # Read Stages
  def self.all
    @@stages.values
  end

  def self.find(id)
    @@stages[id]
  end

  # Create Stage
  def ==(other_stage) 
    self.name() == other_stage.name()
  end 
  
  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end
  
  # Delete Stage
  def delete
    @@stages.delete(self.id)
  end
 
  # Update Stage
  def update(name)
    @name = name
  end
  
  # Find All Artists Aerforming on a Stage
  def artists
    Artist.find_by_stage(self.id)
  end
end