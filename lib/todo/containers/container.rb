module Todo
    module Containers
        class Container
            attr_reader :size

            def initialize(size)
                if not size.is_a?(Integer)
                    type = size.class.to_s.downcase
                    raise ArgumentError, "Got #{type}, expected an integer."
                end

                @size, @values = size, Array.new
            end

            def push!(value)
                raise(NoMemoryError, 'Overflow.') if @values.size == @size

                @values.push(value)
            end

            def empty?
                @values.empty?
            end

            def full?
                @values.size == @size
            end
        end
    end
end
