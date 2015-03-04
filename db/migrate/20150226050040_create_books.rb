class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :name
    	t.boolean :published
    	t.references :article
    end
  end
end
