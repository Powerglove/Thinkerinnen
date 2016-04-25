class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :authors
      t.integer :publishing_year
      t.text :title
      t.string :publisher
      t.string :place_of_publication
      t.references :thinker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
