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
        end
    end
end
