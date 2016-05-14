class AddAdditionalInformationToThinker < ActiveRecord::Migration
  def change
    add_column :thinkers, :additional_information, :text
  end
end
