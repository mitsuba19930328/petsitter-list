source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # 以下自分が記述
  # バグ解消を簡単にするための設定
  gem 'better_errors'
  gem 'binding_of_caller'
  # テスト用ファイル一式
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#以下自分が記述
gem 'uglifier'
gem 'jquery-rails'
gem 'bootstrap'
gem 'bootstrap-social-rails'
gem 'font-awesome-rails'

# rails-i18n:国際化ファイル
gem 'rails-i18n'

# 画像投稿用ファイル
gem 'carrierwave'
gem 'mini_magick'

# ページネーション機能
gem 'kaminari'

# 検索機能
gem 'ransack'

# パンクズリスト機能
gem 'gretel'

# geocoder(GoogleMapApi関連)
gem 'geocoder'

# javascriptとControllerの変数橋渡しを簡単にしてくれる
gem 'gon'

# snsログインのためのツール
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

# 環境変数を使用するためのツール（githubにあげたらまずいデータをまとめる）
gem 'dotenv-rails'

group :production, :staging do
  gem 'unicorn'
end