class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    	t.column :albumname, :string
    	t.column :albumhost, :string
      	t.timestamps
    end
  end
end
