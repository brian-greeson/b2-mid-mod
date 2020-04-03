class CreateRide < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :rating
      t.references :parks, foreign_key: true
    end
  end
end
