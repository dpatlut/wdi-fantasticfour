class CreateDogsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :dogs do |t|
  		t.string :name
  		t.string :owner_id
  	end
  end
end
