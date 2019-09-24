class ChangeAssetColumnType < ActiveRecord::Migration[5.2]
  def up
    change_column :tickets, :asset, :json, using: 'asset::JSON'
  end

  def down
    change_column :tickets, :asset, :string
  end
end
