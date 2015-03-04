class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    	t.time :ff
    end
  end
end
