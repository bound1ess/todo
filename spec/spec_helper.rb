require 'simplecov'

def path(relative)
    File.dir(__FILE__) + '/../lib/todo/' + relative
end

SimpleCov.start {
    add_filter('spec/')
}
