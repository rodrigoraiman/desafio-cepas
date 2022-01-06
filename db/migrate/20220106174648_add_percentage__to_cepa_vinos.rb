class AddPercentageToCepaVinos < ActiveRecord::Migration[5.2]
  def change
    add_column :cepa_vinos, :percentage, :integer
  end
end
