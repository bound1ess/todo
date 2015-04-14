module Todo
    module Containers
        require_relative 'container'
        require_relative 'stack'

        class Queue < Container
            public
            def pop!
                raise(RuntimeError, 'The queue is empty.') if empty?

                @values.shift
            end

            def peek
                return nil if empty?

                @values.first
            end

            def as_stack
                stack = Todo::Containers::Stack.new(@size)

                loop do
                    break if empty?
                    stack.push!(pop!)
                end

                stack
            end

            def is_stack?
                false
            end

            def is_queue?
                true
            end
        end
    end
end
