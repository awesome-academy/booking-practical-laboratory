class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :activate
      t.string :type
      t.integer :phone
      t.string :team

      t.timestamps
    end
  end
end
