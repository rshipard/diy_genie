get '/main' do
    if is_logged_in?
        user_lists = all_user_lists()
        user = current_user()
        erb :'./main/main', locals: { user_lists: user_lists, user: user}
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

get '/lists/:list_id/edit' do |list_id| #reference as a block parameter - whci comes in ORDER, eg each":" in order, not by name
    if is_logged_in?
        results = all_gifts_in_list(list_id)
        erb :'lists/edit', locals: {results: results, list_id: list_id}
    else
        redirect '/'
    end
end

get '/lists/:list_id/delete' do 
    if is_logged_in?
        list_id = params[:list_id] # or reference as a params
        results = all_gifts_in_list(list_id)
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