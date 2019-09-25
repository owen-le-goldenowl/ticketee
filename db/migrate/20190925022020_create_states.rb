class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :color
      t.string :background
    end
    add_reference :tickets, :state, foreign_key: true, index: true
    add_reference :comments, :state, foreign_key: true
  end
end
