class CreateCounter2s < ActiveRecord::Migration
  def change
    create_table :counter2s do |t|
      t.string :productId
      t.string :shopName

      t.timestamps null: false
    end
  end
end
