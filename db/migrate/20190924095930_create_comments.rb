class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text

      t.timestamps
    end
    add_reference :comments, :ticket, foreign_key: true, index: true
    add_reference :comments, :user, foreign_key: true, index: true
  end
end
