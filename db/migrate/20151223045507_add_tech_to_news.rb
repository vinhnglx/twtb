class AddTechToNews < ActiveRecord::Migration
  def change
    add_column :news, :tech, :string
  end
end
