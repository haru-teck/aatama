source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "rails", "~> 7.0.0"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'pry-rails'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'

# nokogiriの問題を回避するために追加
gem 'nokogiri', force_ruby_platform: true

# 開発環境とテスト環境用のデータベース
gem 'mysql2', '~> 0.5', group: [:development, :test]

# 本番環境用のデータベース
gem 'pg', group: :production

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# 以下のgemはコメントアウトされていますが、必要に応じて有効にできます
# gem "redis", "~> 4.0"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
# gem "sassc-rails"
# gem "rack-mini-profiler"
# gem "spring"