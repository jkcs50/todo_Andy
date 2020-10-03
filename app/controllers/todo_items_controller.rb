class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)

    redirect_to @todo_list
  end

  def destroy 
    
    if @todo_item.destroy
      flash[:notice] = "The item #{@todo_item.content} on this todo list was deleted."
    else
      flash[:alert] = @todo_item.errors.full_messages[0]

    end
    redirect_to @todo_list
  end

  def complete
    if @todo_item.completed
      @todo_item.update(completed_at: :null, completed: false)
      redirect_to @todo_list, notice: "Todo item has been unchecked"
    else

      @todo_item.update(completed_at: Time.now, completed: true)
      redirect_to @todo_list, notice: "Todo item #{@todo_item.content} completed! Good job!"

    end
  end

  private
    
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end

end
