class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string      :name
      t.string      :type_of_pet
      t.string      :breed
      t.integer     :age
      t.integer     :weight
      t.integer     :customer_id
      t.timestamps
    end
  end
end
