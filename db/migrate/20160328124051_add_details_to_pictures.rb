class AddDetailsToPictures < ActiveRecord::Migration
  def change_table
  	t.remove :creator
  	t.rename :filename, :albumname
  end
end
