class Artist
  attr_reader :id
  attr_accessor :name, :stage_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @stage_id = attributes.fetch(:stage_id)
    @id = attributes.fetch(:id)
  end

  def ==(artist_to_compare)
    if artist_to_compare != nil
      (self.name() == artist_to_compare.name()) && (self.stage_id() == artist_to_compare.stage_id())
    else
      false
    end
  end

  def self.all
      returned_artists = DB.exec("SELECT * FROM artists;")
      artists = []
      returned_artists.each() do |artist|
      name = artist.fetch('name')
      id = artist.fetch("id").to_i
      stage_id = artist.fetch('stage_id').to_i
      artists.push(Artist.new({:id => id,:name => name,:stage_id => stage_id}))
    end
    artists
  end

  def save
    result = DB.exec("INSERT INTO artists (name, stage_id) VALUES ('#{@name}', #{@stage_id}) RETURNING id;")  
    @id = result.first().fetch("id").to_i
  end

 def self.find(id)
    artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
    if artist
      name = artist.fetch('name')
      stage_id = artist.fetch('stage_id').to_i
      id = artist.fetch('id').to_i
      Artist.new({:name => name, :stage_id => stage_id, :id => id})
    else
      nil
    end
  end

  def update(name, stage_id)
    @name = name
    @stage_id = stage_id
    DB.exec("UPDATE artists SET name = '#{@name}', stage_id = #{@stage_id} WHERE id = #{id};")
  end

  def delete
    DB.exec("DELETE FROM artists WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

  def self.find_by_stage(stage_id)
    returned_artists = DB.exec("SELECT * FROM artists WHERE stage_id = #{stage_id};")
    if returned_artists
      artists = []
      returned_artists.each() do |artist|
        stage_id = artist.fetch('stage_id').to_i
        name = artist.fetch('name')
        id = artist.fetch('id').to_i      
        artists.push(Artist.new({:name => name, :stage_id => stage_id, :id => id}))
      end
      artists
    else
      nil
    end
  end

  def stage
    Stage.find(self.stage_id)
  end
end