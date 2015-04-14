module Todo
    require 'thor'
    require_relative 'task_manager'

    class CLI < Thor
        public
        desc('top', 'display the top priority task')
        def top
            container = container()

            if container.empty?
                puts 'You\'re done!'
            else
                puts "Your top priority task is to #{container.peek.downcase}."
            end
        end

        desc('done', 'mark the top priority task as completed')
        def done
            container = container()

            if not container.empty?
                task = container.peek
                container.pop!

                puts "Marked '#{task}' as completed."

                task_manager().save_tasks(container)
            else
                puts 'You have no tasks to complete.'
            end
        end

        desc('add TASK', 'add a new task')
        def add(task)
            container = container()

            if container.full?
                puts 'Nah, no more tasks!'
            else
                container.push!(task.strip)
                task_manager().save_tasks(container)

                puts 'Okay, the task was added.'
            end
        end

        private
        def task_manager
            Todo::TaskManager.new(File.join(Dir.getwd, '.your_tasks'))
        end

        def container
            task_manager().retrieve_tasks
        end
    end
end
