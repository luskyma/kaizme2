class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :provider, index: true, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
