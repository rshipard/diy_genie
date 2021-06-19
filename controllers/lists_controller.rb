get '/main' do
    if is_logged_in?
        user_lists = all_user_lists()
        user = current_user()
        user_email = user["email"]
        all_friends = friends_list(user_email)
        all_friends_lists = []
        all_friends.each do |friend|
            # get friend id - to search for lists by that id
            friend_id = friend["user_id"]
            friends_lists = find_list_by_owner_id(friend_id)
            all_friends_lists.concat(friends_lists.to_a)
        end
        erb :'./main/main', locals: { user_lists: user_lists, user: user, all_friends: all_friends, all_friends_lists: all_friends_lists}
    else
        redirect '/'
    end
end

post '/new_list' do
    if is_logged_in?
        list_title = params[:list_title]
        list_owner = session[:user_id]
        create_list(list_title, list_owner)
        user_lists = all_user_lists()
        redirect '/main'
    else
        redirect '/'
    end
end

get '/lists/:list_id' do |list_id| #reference as a block parameter - which comes in ORDER, eg each ":" in order, and must then be named as such.
    if is_logged_in?
        results = all_gifts_in_list(list_id)
        list_details = list_details_by_id(list_id)
        erb :'lists/edit', locals: {results: results, list_details: list_details, list_id: list_id}
    else
        redirect '/'
    end
end

put '/lists/:id' do |id|
    if is_logged_in?
        list_id = id
        list_title = params[:new_list_title]
        rename_list(list_id, list_title)
        results = all_gifts_in_list(list_id)
        list_details = list_details_by_id(list_id)
        erb :'lists/edit', locals: {results: results, list_details: list_details, list_id: list_id}
    else
        redirect '/'
    end
end

get '/lists/:list_id/show' do
    list_id = params[:list_id]
    results = all_gifts_in_list(list_id)
    list_details = list_details_by_id(list_id)
    erb :'lists/show', locals: {results: results, list_details: list_details}
end