class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date        :visit_date
      t.boolean     :requires_reminder, :default => true
      t.text        :reason_for_visit
      t.integer     :customer_id
      t.integer     :pet_id
      t.timestamps
    end
  end
end
