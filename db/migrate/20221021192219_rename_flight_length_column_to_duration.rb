class RenameFlightLengthColumnToDuration < ActiveRecord::Migration[7.0]
  def change
    rename_column :flights, :length, :duration
  end
end
