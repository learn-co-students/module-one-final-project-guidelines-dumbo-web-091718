require 'bundler'
Bundler.require
require 'rmagick'
require 'catpix'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil
require_all 'lib'
ActiveRecord::Base.logger = nil
