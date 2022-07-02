class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.string :perpetrator_fullname
      t.string :perpetrator_nickname
      t.date :perpetrator_birthday
      t.text :reason
      t.string :proof
      t.string :witness
      t.string :incident_location
      t.timestamp :incident_date
      t.string :status
      t.boolean :is_valid
      
      t.timestamps
    end
  end
end
