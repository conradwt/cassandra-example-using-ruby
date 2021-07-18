# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails',                    '~> 6.1', '>= 6.1.4'

gem 'activemodel-serializers-xml', '~> 1.0.2'

gem 'bootsnap',                 '>= 1.4.2', require: false

gem 'cequel',                   '~> 3.2', '>= 3.2.1'

gem 'jbuilder',                 '~> 2.7'

gem 'puma',                     '~> 4.3'

gem 'sass-rails',               '>= 6'

gem 'turbolinks',               '~> 5'

gem 'webpacker',                '~> 5.2', '>= 5.2.1'

group :development, :test do
  # gem 'byebug',                 platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen',                 '>= 3.0.5', '< 3.3'

  gem 'spring',                 '~> 2.1'
  gem 'spring-watcher-listen',  '~> 2.0.0'

  gem 'web-console',            '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
