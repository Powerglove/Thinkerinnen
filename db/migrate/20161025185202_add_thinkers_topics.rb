class AddThinkersTopics < ActiveRecord::Migration
  def change
     create_table :thinkers_topics, id: false do |t|
      t.belongs_to :thinker, index: true
      t.belongs_to :topic, index: true
    end
  end
end
