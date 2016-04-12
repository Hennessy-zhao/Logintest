class RemovePartNumberFromPictures < ActiveRecord::Migration
  def change
  	remove_column :pictures, :creator, :string
  end
end
