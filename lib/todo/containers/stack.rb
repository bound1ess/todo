module Todo
    module Containers
        class Stack
            attr_reader :size

            public
            def initialize(size)
                if not size.is_a?(Integer)
                    raise ArgumentError, "Got #{size.class}, expected an integer."
                end

                @size = size
            end
        end
    end
end
