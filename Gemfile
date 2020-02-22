source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'active_storage_validations', '0.8.7'
gem 'awesome_print', '1.8.0'
gem 'bootsnap', '1.4.5', require: false
gem 'pg', '1.2.2'
gem 'puma', '4.3.1'
gem 'rails', '6.0.2.1'
gem 'sass-rails', '6.0.0'
gem 'slim-rails', '3.2.0'
gem 'tzinfo-data', '1.2.5', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '4.2.2'

group :development, :test do
  gem 'byebug', '11.0.1', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '5.1.1'
  gem 'faker', '2.10.2'
  gem 'rubocop', '0.80.0'
  gem 'rubocop-performance', '1.5.2'
  gem 'rubocop-rails', '2.4.2'
end

group :development do
  gem 'listen', '3.2.1'
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console', '4.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.4'
  # See when laucher a 4.x stable version
  gem 'rspec-rails', '4.0.0.beta4'
  gem 'shoulda-matchers', '4.3.0'
  gem 'simplecov', '0.18.2', require: false
end
