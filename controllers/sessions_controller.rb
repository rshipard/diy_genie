post '/login' do
    email = params[:email]
    password = params[:password]

    user = find_user_by_email( email )

    if user && BCrypt::Password.new(user['password_digest']) == password
        session[:user_id] = user['id']
        redirect '/main'
    else
        erb :index , locals: { error_message: 'Incorrect password or username'}
    end
end

delete '/logout' do
    session[:user_id] = nil
    redirect '/'
end

# Params viewer for testing
post '/test' do
    "#{params}"
end

# Params form action code to Copy/Paste for debugging 
# <form action="/test" method="POST">