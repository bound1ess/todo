require path('containers/stack')

RSpec.describe(Todo::Containers::Stack) do

    before(:each) do
        @sut = Todo::Containers::Stack.new(3)
    end

    it('is a stack') do
        expect(@sut.is_stack?).to eq(true)
        expect(@sut.is_queue?).to eq(false)
    end

    it('pops a value from the stack') do
        expect {
            @sut.pop!
        }.to raise_error(RuntimeError, 'The stack is empty.')

        @sut.push! 1
        @sut.push! 2

        expect(@sut.pop!).to eq(2)
        expect(@sut.pop!).to eq(1)
    end

    it('returns the top element of the stack') do
        expect(@sut.peek).to eq(nil)

        @sut.push! 1
        @sut.push! 2

        expect(@sut.peek).to eq(2)
    end

    it('can be converted to a queue') do
        @sut.push! 1
        @sut.push! 2

        queue = @sut.as_queue

        expect(queue.is_queue?).to eq(true)

        expect(queue.pop!).to eq(1)
        expect(queue.pop!).to eq(2)
    end
end
