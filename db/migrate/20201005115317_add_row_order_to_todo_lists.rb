class AddRowOrderToTodoLists < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_lists, :row_order, :integer
  end
end
