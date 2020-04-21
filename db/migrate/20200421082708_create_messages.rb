class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :chat_message
      t.string :chat_image
      t.references :group, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
