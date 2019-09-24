class ChangeAssetColumnName < ActiveRecord::Migration[5.2]
  def up
    rename_column :tickets, :asset, :assets
  end

  def down
    rename_column :tickets, :assets, :asset
  end
end
