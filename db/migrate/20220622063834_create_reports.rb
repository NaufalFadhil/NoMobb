class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :user_id
      t.string :perpetrator
      t.string :reason
      t.string :proof
      t.string :witness
      t.string :incident_location
      t.string :incident_date
      t.string :status
      t.string :is_valid
      t.string :deleted_at

      t.timestamps
    end
  end
end
