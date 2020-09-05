class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :mode
      t.string :text

      t.timestamps
    end
  end
end
