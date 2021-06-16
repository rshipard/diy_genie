get '/main' do
    if is_logged_in?
        user_lists = all_user_lists()
        username = find_username()
        erb :'./main/main', locals: { user_lists: user_lists, username: username}
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
        erb :'./main/main', locals: { user_lists: user_lists}
    else
        redirect '/'
    end
end

get '/lists/:list_id/edit' do |list_id|
    if is_logged_in?
        results = all_gifts_in_list()
        erb :'lists/edit', locals: {results: results}
    else
        redirect '/'
    end
end

get '/lists/:list_id/delete' do
    if is_logged_in?
        list_id = :list_id
        results = all_gifts_in_list()
        erb :'lists/delete', locals: {results: results}
    else
        redirect '/'
    end
end

delete '/lists/:list_id/delete' do
    if is_logged_in?
        list_id = :list_id
        delete_list() #needs to be created and linked
        user_lists = all_user_lists()
        erb :'./main/main', locals: { user_lists: user_lists}
    else
        redirect '/'
    end
end