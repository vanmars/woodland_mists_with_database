class Stage
  attr_reader :name, :id

  @@stages = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  # Create Stage
  def ==(other_stage) 
    self.name() == other_stage.name()
  end 
  
  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end
  
  # Read Stages
  def self.all
    @@stages.values
  end
end
  # Update Stage

  # Delete Stage

  # @@stages = {1: {name: stage1, id:1}, 2: {name: stage2, id: 2}}
  # Access stages object
  # Stage.all =[{name: stage1, id:1}, {name: stage2, id: 2}]    for testing
  # @@stages[1].name   getting name of specific stage by key/id
  #Access the albums obj at the name key