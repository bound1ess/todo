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

                @size = size
            end
        end
    end
end
