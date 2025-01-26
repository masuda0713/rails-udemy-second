source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.0.8", ">= 7.0.8.7"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'concurrent-ruby', '1.3.4'

group :development, :test do # 開発環境とテスト環境でのみ有効
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do # 開発環境でのみ有効
  gem "web-console"
  gem "mysql2", "~> 0.5" # MySQLを使用する場合
end

group :test do # テスト環境でのみ有効
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do # 本番環境でのみ有効
  gem "pg", '~>1.2.3' # PostgreSQLを使用する場合
end