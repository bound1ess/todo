module Todo
    module Containers
        require_relative 'stack'

        class Queue < Stack
            public
            def pop!
                raise RuntimeError, 'The queue is empty.' if empty?

                @stack.shift
            end

            def peek
                return nil if empty?

                @stack.first
            end

            def as_stack
                stack = Todo::Containers::Stack.new(@size)

                loop do
                    break if empty?
                    stack.push!(pop!)
                end

                stack
            end
        end
    end
end
