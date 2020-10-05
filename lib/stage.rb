class Stage
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  # For Testing
  def self.clear
    DB.exec("DELETE FROM stages *;")
  end

   # Read Stages
  def self.all
    returned_stages = DB.exec("SELECT * FROM stages;")
    stages = []
    returned_stages.each() do |stage|
      name = stage.fetch('name')
      id = stage.fetch("id").to_i
      stages.push(Stage.new({:name => name, :id => id}))
    end
    stages
  end

  def self.find(id)
    stage = DB.exec("SELECT * FROM stages where id = #{id};").first
    if stage
      name = stage.fetch ("name")
      id = stage.fetch("id").to_i
      Stage.new({:name =>name, :id => id})
    else
      nil
    end
  end

  # Create Stage
  def ==(other_stage) 
    self.class.eql?(other_stage.class) & self.name.eql?(other_stage.name) 
  end 
  
  def save
    result = DB.exec("INSERT INTO stages (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
  
  # Delete Stage
  def delete
    DB.exec("DELETE FROM stages WHERE id = #{@id};")
    DB.exec("DELETE FROM artists WHERE stage_id = #{@id};")
 end
 
  # Update Stage
  def update(name)
    @name = name
    DB.exec("UPDATE stages SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  # Find All Artists Aerforming on a Stage
  def artists
    Artist.find_by_stage(self.id)
  end
end