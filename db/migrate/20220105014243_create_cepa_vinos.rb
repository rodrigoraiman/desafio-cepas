class CreateCepaVinos < ActiveRecord::Migration[5.2]
  def change
    create_table :cepa_vinos do |t|
      t.references :cepa, foreign_key: true
      t.references :vino, foreign_key: true

      t.timestamps
    end
  end
end
