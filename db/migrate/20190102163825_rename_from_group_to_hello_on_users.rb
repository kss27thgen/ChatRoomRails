class RenameFromGroupToHelloOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :group, :hello
  end
end
