class CreateRover < ActiveRecord::Migration

  def self.up
    create_table :rovers do |t|
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.string  :direction
      t.string  :movements
      t.timestamps
    end
  end

  def self.down
    drop_table :rovers
  end
end
