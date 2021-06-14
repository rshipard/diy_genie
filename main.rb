require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

enable :sessions

require_relative './db/db'

require_relative './models/users'
require_relative './models/lists'


require_relative './helpers/sessions'

require_relative './controllers/users_controller'
require_relative './controllers/sessions_controller'
require_relative './controllers/lists_controller'

get '/' do
  erb :'./index', locals: { error_message: '' }
end
