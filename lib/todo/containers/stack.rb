module Todo
    module Containers
        class Stack
            attr_reader :size

            public
            def initialize(size)
                if not size.is_a?(Integer)
                    type = size.class.to_s.downcase
                    raise ArgumentError, "Got #{type}, expected an integer."
                end

                @size, @stack = size, Array.new
            end

            def push!(value)
                raise(NoMemoryError, 'Stack overflow.') if @stack.size == @size

                @stack.push(value)
            end

            def pop!
                raise(RuntimeError, 'The stack is empty.') unless @stack.size > 0

                @stack.pop
            end

            def peek
                return nil if @stack.empty?

                @stack.last
            end

            def empty?
                @stack.size == 0
            end

            def full?
                ! empty?
            end
        end
    end
end
