require path('containers/stack')

RSpec.describe(Todo::Containers::Stack) do
    before(:each) do
        @sut = Todo::Containers::Stack.new(3)
    end

    it('raises an exception if an invalid size was supplied') do
        expect {
            Todo::Containers::Stack.new(5)
        }.to_not(raise_error)

        expect {
            Todo::Containers::Stack.new('5')
        }.to raise_error(ArgumentError, 'Got string, expected an integer.')
    end

    it('pushes a value to the stack') do
        expect(@sut.size).to eq(3)

        [1, 2, 3].each { |value| @sut.push! value }

        expect {
            @sut.push! 4
        }.to raise_error(NoMemoryError, 'Stack overflow.')
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
end
