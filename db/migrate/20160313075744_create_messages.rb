class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.text :title
    	t.text :message
    	t.references :user, index: true, foreign_key: true

      	t.timestamps 
    end
  end
end
