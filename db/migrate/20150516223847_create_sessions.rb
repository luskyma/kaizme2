class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :session_id
      t.boolean :open

      t.timestamps null: false
    end
  end
end
