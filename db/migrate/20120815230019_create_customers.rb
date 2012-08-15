class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string      :first_name
      t.string      :last_name
      t.integer     :created_by
      t.timestamps
    end
  end
end
