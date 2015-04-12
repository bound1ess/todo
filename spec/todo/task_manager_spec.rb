require path('task_manager')

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

    after(:each) do
        File.delete(@path) if File.exists?(@path)
    end
end
