class AddDetailsToPins < ActiveRecord::Migration[5.2]
  def change
    add_column :pins, :details, :string
  end
end
