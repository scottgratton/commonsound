class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :website
      t.string :location
      t.string :bio

      t.timestamps
    end
  end
end
