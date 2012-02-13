Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-drivers'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Drivers engine for Refinery CMS'
  s.date              = '2012-02-13'
  s.summary           = 'Drivers engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
