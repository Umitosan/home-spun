class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :description , :string
      t.column :price, :decimal
      t.column :image_url, :string

      t.timestamps
    end
  end
end
