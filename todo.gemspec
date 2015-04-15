Gem::Specification.new { |spec|
    spec.name = 'todo'
    spec.version = '0.0.0' #!
    spec.date = Time.new.strftime('%Y-%m-%d')
    spec.license = 'MIT'
    spec.summary = 'PoC'
    spec.description = 'Simple CLI to-do app for hackers.'
    spec.authors = ['bound1ess']
    spec.email = 'bound1ess.dev@gmail.com'
    spec.homepage = 'https://github.com/bound1ess/todo'

    spec.required_ruby_version = '>= 2.0.0' # quite random
    spec.executables = ['todo']

    spec.add_dependency('thor', '~> 0.19.1', '>= 0.19.1')

    spec.add_development_dependency('rspec', '~> 3.2.0', '>= 3.2.0')
    spec.add_development_dependency('simplecov', '~> 0.9.2', '>= 0.9.2')
    spec.add_development_dependency('thin', '~> 1.6.3', '>= 1.6.3')

    spec.files = Dir['lib/todo/**/*.rb'] + ['LICENSE', 'README.md']
    spec.test_files = Dir['spec/**/*.rb']
}
