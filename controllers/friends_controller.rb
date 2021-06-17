get '/friends' do
    if is_logged_in?
        friends = all_friends_for_user()
        erb :'friends/edit', locals: {friends: friends}
    else
        redirect '/'
    end
end

post '/add_friend' do
    if is_logged_in?
        create_friend()
        friends = all_friends_for_user()
        erb :'friends/edit', locals: {friends: friends}
    else
        redirect '/'
    end
end

delete '/remove-friend' do
    if is_logged_in?
        remove_friend(params[:friends_email])
        friends = all_friends_for_user()
        erb :'friends/edit', locals: {friends: friends}
    else
        redirect '/'
    end
end