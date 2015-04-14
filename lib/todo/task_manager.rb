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
            @default_container = 'queue'
            @size = 5
        end

        def retrieve_tasks
            create_if_missing

            lines = File.read(@path).lines.map { |line| line.strip }

            if lines.empty? or not ['queue', 'stack'].include?(lines.first)
                raise RuntimeError, 'Invalid tasks file.'
            end

            type = lines.shift

            if type == 'queue'
                container = Todo::Containers::Queue.new(@size)
            else
                container = Todo::Containers::Stack.new(@size)
            end

            lines.each { |task| container.push!(task) }

            container
        end

        def save_tasks(container)
            # Find out the container type.
            if container.is_a?(Todo::Containers::Queue)
                type = 'queue'
            else
                type = 'stack'
            end

            # Get all stored tasks.
            tasks = Array.new

            loop do
                break if container.empty?
                tasks.push(container.pop!)
            end

            puts type
            File.write(@path, [type].concat(tasks).join($/))
        end

        private
        def create_if_missing
            if not File.exists?(@path)
                File.write(@path, @default_container)
            end
        end
    end
end
