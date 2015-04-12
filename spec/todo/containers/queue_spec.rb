require path('containers/queue')

RSpec.describe(Todo::Containers::Queue) do

    before(:each) do
        @sut = Todo::Containers::Queue.new(2)
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
end
