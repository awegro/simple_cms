class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
        t.string "name"
        t.integer "position"
        t.boolean "visible"
      t.timestamps
    end
  end
    def self.down
    drop_table :subjects
  end
end
