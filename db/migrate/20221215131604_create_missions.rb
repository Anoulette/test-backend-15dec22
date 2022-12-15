class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.date :date
      t.integer :mission_type
      t.integer :price
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
