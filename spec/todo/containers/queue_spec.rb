require path('containers/queue')

RSpec.describe(Todo::Containers::Queue) do

    before(:each) do
        @sut = Todo::Containers::Queue.new(2)
    end

    it('is a queue') do
        expect(@sut.is_stack?).to eq(false)
        expect(@sut.is_queue?).to eq(true)
    end

    it('pops a value from the queue') do
        expect {
            @sut.pop!
        }.to raise_error(RuntimeError, 'The queue is empty.')

        @sut.push! 1
        @sut.push! 2

        expect(@sut.pop!).to eq(1)
        expect(@sut.pop!).to eq(2)
    end

    it('returns the top element of the queue') do
        expect(@sut.peek).to eq(nil)

        @sut.push! 1
        @sut.push! 2

        expect(@sut.peek).to eq(1)
    end

    it('can be converted to a stack') do
        @sut.push! 1
        @sut.push! 2

        stack = @sut.as_stack

        expect(stack.is_stack?).to eq(true)

        expect(stack.pop!).to eq(2)
        expect(stack.pop!).to eq(1)
    end
end
