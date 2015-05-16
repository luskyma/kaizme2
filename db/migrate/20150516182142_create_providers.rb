class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.text :bio
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
