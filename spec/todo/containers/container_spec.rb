require path('containers/container')

RSpec.describe(Todo::Containers::Container) do

    before(:each) do
        @sut = Todo::Containers::Container.new(3)
    end

    it('raises an exception if an invalid size was supplied') do
        expect {
            Todo::Containers::Stack.new(5)
        }.to_not(raise_error)

        expect {
            Todo::Containers::Stack.new('5')
        }.to raise_error(ArgumentError, 'Got string, expected an integer.')
    end

    it('pushes a value to the container') do
        expect(@sut.size).to eq(3)
        expect(@sut.real_size).to eq(0)

        [1, 2, 3].each { |value| @sut.push! value }

        expect {
            @sut.push! 4
        }.to raise_error(NoMemoryError, 'Overflow.')

        expect(@sut.real_size).to eq(3)
    end

    it('checks if the container is full/empty') do
        expect(@sut.empty?).to eq(true)
        expect(@sut.full?).to eq(false)

        [1, 2].each do |value|
            @sut.push!(value)
            expect(@sut.full?).to eq(false)
        end

        @sut.push! 3

        expect(@sut.empty?).to eq(false)
        expect(@sut.full?).to eq(true)
    end
end
