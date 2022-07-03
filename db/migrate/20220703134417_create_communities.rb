class CreateCommunities < ActiveRecord::Migration[7.0]
  def change
    create_table :communities do |t|
      t.integer :sender
      t.string :title
      t.text :message_preview

      t.timestamps
    end
  end
end
