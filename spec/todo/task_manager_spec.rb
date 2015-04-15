require path('task_manager')

# Using mocks would certainly be better, but nah.
require path('containers/stack')
require path('containers/queue')

RSpec.describe(Todo::TaskManager) do

    before(:each) do
        @path = File.join(Dir.getwd, 'tasks12345')
        @sut = Todo::TaskManager.new(@path)
    end

    it('raises an error if an invalid argument was supplied to the constructor') do
        expect {
            Todo::TaskManager.new('foo')
        }.not_to(raise_error)

        expect {
            Todo::TaskManager.new(123)
        }.to raise_error(ArgumentError, 'Expected a string, got fixnum.')
    end

    it('stores a container in a plaintext file') do
        @sut.save_tasks(Todo::Containers::Stack.new(0))

        expect(File.read(@path)).to eq('stack' + $/)

        container = Todo::Containers::Queue.new(2)
        container.push! 'foo'
        container.push! 'bar'

        @sut.save_tasks(container)

        expect(File.read(@path)).to eq(['queue', 'foo', 'bar'].join($/) + $/)
    end

    it('returns all tasks stored in a container') do
        container = @sut.retrieve_tasks

        expect(container).to be_kind_of(Todo::Containers::Queue)
        expect(container.empty?).to eq(true)

        @sut.save_tasks(Todo::Containers::Stack.new(0))

        container = @sut.retrieve_tasks

        expect(container).to be_kind_of(Todo::Containers::Stack)
        expect(container.empty?).to eq(true)

        # Let's make it fail.
        File.write(@path, 'abc')

        expect {
            @sut.retrieve_tasks
        }.to raise_error(RuntimeError, 'Invalid tasks file.')
    end

    after(:each) do
        File.delete(@path) if File.exists?(@path)
    end
end
