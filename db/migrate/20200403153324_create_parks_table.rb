class CreateParksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.float :price
    end
  end
end
