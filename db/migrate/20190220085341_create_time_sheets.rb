class CreateTimeSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :time_sheets do |t|
      t.integer :room_id
      t.datetime :time

      t.timestamps
    end
  end
end
