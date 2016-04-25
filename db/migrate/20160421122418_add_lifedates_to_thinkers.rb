class AddLifedatesToThinkers < ActiveRecord::Migration
  def change
  	add_column :thinkers, :life_date_birth, :integer
  	add_column :thinkers, :life_date_death, :integer
  end
end
