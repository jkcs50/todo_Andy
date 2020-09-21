class TodoItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)

    redirect_to @todo_list
  end

  def destroy 
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:notice] = "The item #{@todo_item.content} on this todo list was deleted."
    else
      flash[:alert] = @todo_item.errors.full_messages[0]

    end
    redirect_to @todo_list
  end

  private
    
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end

end
