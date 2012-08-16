class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string      :first_name
      t.string      :last_name
      t.integer      :user_id
      t.integer     :created_by
      t.integer     :doctor_id
      t.timestamps
    end
  end
end
