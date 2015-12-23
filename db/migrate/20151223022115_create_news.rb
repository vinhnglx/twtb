class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :author
      t.string :title
      t.text :desc
      t.string :source

      t.timestamps null: false
    end
  end
end
