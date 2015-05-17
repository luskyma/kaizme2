class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :session_id
      t.string :token
      t.boolean :active

      t.timestamps null: false
    end
  end
end
