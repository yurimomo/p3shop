class CreateP3s < ActiveRecord::Migration
  def change
      create_table :p3s do |t|
      t.string "title"
      t.text  "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "user_id"
      t.string   "user_name"
      t.timestamps null: false
    end
  end
end
