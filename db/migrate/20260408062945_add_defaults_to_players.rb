class AddDefaultsToPlayers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :players, :wins_count, 0
    change_column_default :players, :losses_count, 0
  end
end
