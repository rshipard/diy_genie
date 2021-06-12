post '/login' do
    email = params[:email]
    password = params[:password]

    user = find_user_by_email( email )

    if user && BCrypt::Password.new(user['password_digest']) == password
        session[:user_id] = user['id']
        redirect '/lists'
    else
        erb :index , locals: { error_message: 'Incorrect password'}
    end

end