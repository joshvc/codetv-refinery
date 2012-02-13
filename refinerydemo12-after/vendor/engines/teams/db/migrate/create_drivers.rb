class CreateDrivers < ActiveRecord::Migration

  def self.up
    create_table :drivers do |t|
      t.string :name
      t.text :bio
      t.integer :photo_id
      t.integer :team_id
      t.integer :position

      t.timestamps
    end

    add_index :drivers, :id

    load(Rails.root.join('db', 'seeds', 'drivers.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "drivers"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/drivers"})
    end

    drop_table :drivers
  end

end
