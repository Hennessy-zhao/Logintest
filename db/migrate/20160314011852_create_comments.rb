class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :commenter
      	t.text :comment_message
      	t.references :message, index: true, foreign_key: true
      	t.timestamps 
    end
  end
end
