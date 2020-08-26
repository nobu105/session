class AddAudioToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :audio, :string
  end
end
