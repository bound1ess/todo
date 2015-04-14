module Todo
    module Containers
        require_relative 'container'
        require_relative 'queue'

        class Stack < Container
            public
            def pop!
                raise(RuntimeError, 'The stack is empty.') if empty?

                @values.pop
            end

            def peek
                return nil if empty?

                @values.last
            end

            def as_queue
                queue = Todo::Containers::Queue.new(@size)

                loop do
                    break if empty?
                    queue.push!(pop!)
                end

                queue
            end

            def is_stack?
                true
            end

            def is_queue?
                false
            end
        end
    end
end
