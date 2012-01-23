class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
        t.string "name"
        t.integer "position"
        t.boolean "visible"
        t.string "content_type"
        t.string "content"
        t.integer "page_id"
      t.timestamps
    end
      add_index("sections","page_id")
  end
    def down
        drop table :sections
    end
end
