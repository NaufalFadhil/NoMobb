class CreateCommunityMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :community_messages do |t|
      t.integer :community_id
      t.integer :sender
      t.string :message

      t.timestamps
    end
  end
end
