class AddUniqueToAirportCode < ActiveRecord::Migration[7.0]
  def change
    change_column :airports, :code, :string, unique: true
  end
end
