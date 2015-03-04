class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :from
    	t.string :to
    	t.string :body
    	t.string :subject
    	t.references :user
    end
  end
end
