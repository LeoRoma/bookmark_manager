require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable
  get '/' do
    'Hello world'
  end

  get '/bookmarks' do
    erb :bookmarks
  end

  run! if app_file == $0
end
