class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :wins_count
      t.integer :losses_count

      t.timestamps
    end
  end
end
