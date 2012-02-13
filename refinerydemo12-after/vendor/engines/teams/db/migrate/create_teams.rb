class CreateTeams < ActiveRecord::Migration

  def self.up
    create_table :teams do |t|
      t.string :name
      t.text :bio
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

    add_index :teams, :id

    load(Rails.root.join('db', 'seeds', 'teams.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "teams"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/teams"})
    end

    drop_table :teams
  end

end
