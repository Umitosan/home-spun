class AddComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.column :description, :text
      t.column :user_id, :integer
      t.column :product_id, :integer

      t.timestamps
    end
  end
end
