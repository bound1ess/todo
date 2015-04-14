module Todo
    require 'thor'

    require_relative 'task_manager'
    require_relative 'containers/stack'
    require_relative 'containers/queue'

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

        desc('use TYPE', 'switch to given container type')
        def use(type)
            if not ['stack', 'queue'].include?(type)
                puts 'Nah, invalid container type. Try "stack" or "queue".'
            else
                container = container()

                if type == 'queue' and not container.is_a?(Todo::Containers::Queue)
                    container = container.as_queue
                elsif type == 'stack' and container.is_a?(Todo::Containers::Queue)
                    container = container.as_stack
                else
                    puts "Already using #{type}."
                    return nil
                end

                task_manager().save_tasks(container)

                puts "Now using #{type}."
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
