class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.column :creator, :string
    	t.column :filename, :string
      	t.timestamps 
    end
  end
end
