class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false, unique: true
      t.integer :author_id, null: false
      t.timestamps
    end

    add_index :polls, [:title, :author_id]
  end
end
