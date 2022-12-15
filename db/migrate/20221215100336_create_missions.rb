class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.integer :first_checkin
      t.integer :last_checkout
      t.integer :checkout_checkin
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
