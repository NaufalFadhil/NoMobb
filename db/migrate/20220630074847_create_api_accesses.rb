class CreateApiAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :api_accesses do |t|
      t.integer :user_id
      t.string :token
      t.datetime :expired_date

      t.timestamps
    end
  end
end
