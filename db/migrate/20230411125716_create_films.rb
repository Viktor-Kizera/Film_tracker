class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :genre
      t.string :author
      t.integer :year
      t.timestamps
    end
  end
end
