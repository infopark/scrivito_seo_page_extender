$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scrivito_seo_page_extender/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.platform    = Gem::Platform::RUBY
  gem.name        = "scrivito_seo_page_extender"
  gem.version     = ScrivitoSeoPageExtender::VERSION
  gem.authors     = ["Scrivito"]
  gem.email       = ["support@scrivito.com"]
  gem.homepage    = "https://www.scrivito.com"
  gem.summary     = "A Scrivito Widget to extend your Page with some useful SEO Features, Metadata or Open Graph."
  gem.description = "A Scrivito Widget to extend your Page with some useful SEO Features, Metadata or Open Graph."
  gem.license     = "LGPL-3.0"

  gem.files = Dir["{app,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  gem.add_dependency 'scrivito_sdk'
end
