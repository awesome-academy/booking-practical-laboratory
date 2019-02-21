class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.integer :size
      t.string :kind
      t.boolean :status

      t.timestamps
    end
  end
end
