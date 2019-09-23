class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :asset
      t.references :ticket, foreign_key: true
      t.timestamps
    end
    remove_column :tickets, :asset
  end
end
