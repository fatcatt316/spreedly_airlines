source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.7', '>= 5.0.7.2'

gem 'sqlite3', '~> 1.3.6'

gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'puma', '~> 3.0' # Use Puma as the app server
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


gem 'spreedly', '~> 2.0.24'

gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails' # Use jquery as the JavaScript library

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri # Call 'byebug' anywhere in the code to stop execution and get a debugger console
end

group :development do
  gem 'web-console', '>= 3.3.0' # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
