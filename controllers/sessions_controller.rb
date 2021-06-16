post '/login' do
    email = params[:email]
    password = params[:password]

    user = find_user_by_email( email )

    if user && BCrypt::Password.new(user['password_digest']) == password
        session[:user_id] = user['id']
        user_lists = all_user_lists()
        username = find_username()
        erb :'main/main', locals: { user_lists: user_lists, username: username}
    else
        erb :index , locals: { error_message: 'Incorrect password or username'}
    end
end

delete '/logout' do
    session[:user_id] = nil
    redirect '/'
end
