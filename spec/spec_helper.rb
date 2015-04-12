require 'simplecov'

def path(relative)
    File.dirname(__FILE__) + '/../lib/todo/' + relative
end

SimpleCov.start {
    add_filter('spec/')
}
