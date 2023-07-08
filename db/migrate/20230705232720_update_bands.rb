class UpdateBands < ActiveRecord::Migration[7.0]
  def change
    remove_column :bands, :name
    add_column :bands, :name, :string, null: false, unique: true
  end
end
