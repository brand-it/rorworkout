class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "first_name",                             :null => false
      t.string   "last_name",                              :null => false
      t.string   "email",                                  :null => false
      t.string   "crypted_password",                       :null => false
      t.string   "password_salt",                          :null => false
      t.string   "persistence_token",                      :null => false
      t.string   "single_access_token",                    :null => false
      t.string   "perishable_token",                       :null => false
      t.integer  "login_count",         :default => 0,     :null => false
      t.integer  "failed_login_count",  :default => 0,     :null => false
      t.datetime "last_request_at"
      t.datetime "current_login_at"
      t.datetime "last_login_at"
      t.string   "current_login_ip"
      t.string   "last_login_ip"
      t.integer  "access_level",        :default => 0
      t.boolean  "active",              :default => false
      t.boolean  "approved",            :default => false
      t.boolean  "confirmed",           :default => false
      t.timestamps
    end
  end
end
