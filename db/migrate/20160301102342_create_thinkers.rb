class CreateThinkers < ActiveRecord::Migration
  def change
    create_table :thinkers do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
