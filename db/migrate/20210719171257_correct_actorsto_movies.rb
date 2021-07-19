class CorrectActorstoMovies < ActiveRecord::Migration[5.2]
  def self.up
    change_table :actors do |t|
      t.references :movie
    end
  end

  def self.down
     remove_column :actors, :movies_id
 end
end
