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
end
