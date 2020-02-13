class AddForeignKeyTo < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :doses, :ingredients
    add_foreign_key :doses, :cocktails
  end
end
