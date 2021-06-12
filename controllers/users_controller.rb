post '/signup' do
    first_name = params[:first_name]
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]

    create_user(first_name, email, password)
    redirect '/lists'
end

get '/lists' do
    erb :'/lists/lists'
end