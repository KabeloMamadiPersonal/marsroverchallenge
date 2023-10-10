class CreatePlateau < ActiveRecord::Migration

  def self.up
    create_table :plateaus do |t|
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end

  def self.down
    drop_table :plateaus
  end
end
