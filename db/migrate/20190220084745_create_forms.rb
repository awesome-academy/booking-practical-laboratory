class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :time_id
      t.string :intent
      t.integer :phone

      t.timestamps
    end
  end
end
