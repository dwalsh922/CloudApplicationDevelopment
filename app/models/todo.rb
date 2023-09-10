class Todo < ApplicationRecord

    def get_todo_status 
        if (self.completed) == true
            return "Completed"
        else
            return "Not Completed"
        end
    end
end
