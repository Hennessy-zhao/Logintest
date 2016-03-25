class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.column :username, :string
    	t.column :userpassword, :string
    	t.column :email, :string
      	t.timestamps
    end
  end
end
