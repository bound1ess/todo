module Todo
    class TaskManager
        def initialize(path)
            if not path.is_a?(String)
                type = path.class.to_s.downcase
                raise ArgumentError, "Expected a string, got #{type}."
            end

            @path = path
        end
    end
end
