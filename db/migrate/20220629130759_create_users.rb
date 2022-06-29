class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password
      t.string :is_verified
      t.string :role

      t.timestamps
    end
  end
end
