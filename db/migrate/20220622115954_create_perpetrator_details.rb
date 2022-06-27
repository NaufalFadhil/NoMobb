class CreatePerpetratorDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :perpetrator_details do |t|
      t.string :fullname
      t.string :nickname
      t.date :birthday

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
