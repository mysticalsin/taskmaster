class CreateTaskmasterTables < ActiveRecord::Migration[8.1]
  def change
    create_table :guests do |t|
      t.timestamps
    end

    create_table :lists do |t|
      t.references :guest, null: false, foreign_key: true
      t.string :name, null: false
      t.timestamps
    end

    create_table :tasks do |t|
      t.references :list, null: false, foreign_key: true
      t.string :title, null: false
      t.text :note
      t.boolean :completed, null: false, default: false
      t.date :due_at, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
