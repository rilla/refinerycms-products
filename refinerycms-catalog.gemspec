Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-catalog'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Catalog engine for Refinery CMS'
  s.date              = '2011-10-04'
  s.summary           = 'Catalog engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
  s.add_dependency    'render_inheritable'
end
