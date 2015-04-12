require path('task_manager')

RSpec.describe(Todo::TaskManager) do

    before(:each) do
        @path = File.join(Dir.getwd, 'tasks12345')
        @sut = Todo::TaskManager.new(@path)
    end

    after(:each) do
        File.delete(@path) if File.exists?(@path)
    end
end
