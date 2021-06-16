get '/friends' do
    if is_logged_in?
        user_id = :user_id
        friends = all_friends_for_user()
        erb :'friends/edit', locals: {friends: friends}
    else
        redirect '/'
    end
end

post '/add_friend' do
    if is_logged_in?
        user_id = :user_id
        create_friend()
        friends = all_friends_for_user()
        erb :'friends/edit', locals: {friends: friends}
    else
        redirect '/'
    end
end