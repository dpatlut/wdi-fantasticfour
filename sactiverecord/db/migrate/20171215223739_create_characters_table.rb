class CreateCharactersTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :characters do |t|
  		t.string :name
  		t.string :house_id
  		t.string :image_url
  	end
  end
end
