class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string      :name
      t.string      :address
      t.string      :city
      t.string      :state
      t.string      :zip
      t.string      :years_of_experience
      t.integer     :created_by
      t.timestamps
    end
    
    create_table :degrees do |t|
      t.string      :name
      t.string      :school_name
      t.integer     :doctor_id
      t.timestamps
    end
  end
end
