class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :foo
      t.string :bar

      t.timestamps
    end
  end
end
