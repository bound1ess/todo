module Todo
    # All tasks are stored in a single plaintext file.
    # The first line should ALWAYS contain the container type.
    # For example, "queue" or "stack".
    # Then the tasks follow, each being placed on its own line.
    # For example:
    # queue
    # Solve 5 easy HackerRank problems.
    # Write an article to my blog.
    # Check out GitHub's trending repositories.
    class TaskManager
        require_relative 'containers/stack'
        require_relative 'containers/queue'

        public
        def initialize(path)
            if not path.is_a?(String)
                type = path.class.to_s.downcase
                raise ArgumentError, "Expected a string, got #{type}."
            end

            @path = path
        end

        def retrieve_tasks
            # ...
        end

        def save_tasks(container)
            # ...
        end

        private
        def create_if_missing
            # ...
        end
    end
end
