require "test_helper"

class TodoTest < ActiveSupport::TestCase

  setup do
    @todo = Todo.new
    @one_todo = todos(:one)
    @two_todo = todos(:two)


  end
      
   test "should save task" do
     assert @todo.save
   end

   test "find task" do
    @todo.title = "test"
    @todo.description = "test"
    @todo.completed = false
    @todo.save

    expected_todo = Todo.find(@todo.id)
    assert_equal(expected_todo.title, @todo.title)
    assert_equal(expected_todo.description, @todo.description)
    assert_equal(expected_todo.completed, @todo.completed)
   end

   test "should delete todo" do
    @todo.save
    assert_difference("Todo.count", -1) do  
      @todo.destroy
    end
  end

    test "should update todo" do
      @one_todo = todos(:one)
      updated_title = "New Title"
      @one_todo.update({
        title: updated_title
      })
      assert_equal(updated_title, @one_todo.title  )
    end

    test "should be completed when true" do
      assert_equal("Completed", @one_todo.get_todo_status)
    end
    test "should be not completed when false" do
      assert_equal("Not Completed", @two_todo.get_todo_status)
    end
end
