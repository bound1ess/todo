require path('containers/queue')

RSpec.describe(Todo::Containers::Queue) do

    before(:each) do
        @sut = Todo::Containers::Queue.new(2)
    end
end
