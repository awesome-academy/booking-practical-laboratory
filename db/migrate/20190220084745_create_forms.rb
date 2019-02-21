class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.integer :user_id
      t.integer :status
      t.string :intent

      t.timestamps
    end
  end
end
