class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
        t.string "name"
        t.string "permalink"
        t.integer "position"
        t.boolean "visible"
        t.integer "subject_id"
        t.timestamps
    end
      add_index("pages","permalink")
      add_index("pages","subject_id")
  end
    def down
        drop_table :pages
    end
end
