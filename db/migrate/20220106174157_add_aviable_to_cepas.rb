class AddAviableToCepas < ActiveRecord::Migration[5.2]
  def change
    add_column :cepas, :aviable, :boolean
  end
end
