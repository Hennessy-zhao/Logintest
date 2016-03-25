class AddPartNumberToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :img, :string
  end
end
