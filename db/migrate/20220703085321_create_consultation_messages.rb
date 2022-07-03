class CreateConsultationMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :consultation_messages do |t|
      t.string :roomchat_id
      t.string :sender
      t.string :message
      t.string :receiver

      t.timestamps
    end
  end
end
