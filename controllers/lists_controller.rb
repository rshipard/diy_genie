post '/new_list' do
    if is_logged_in?
        list_title = params[:list_title]
        list_owner = session[:user_id]
        create_list(list_title, list_owner)
        user_lists = all_user_lists()
        erb :'lists/show', locals: { user_lists: user_lists}
    else
        redirect '/'
    end
end

get '/lists/edit' do
    erb :'lists/edit'
end

get '/lists' do
    if is_logged_in?
        session[:user_id] = user['id']
        user_lists = all_user_lists()
        erb :'lists/show', locals: { user_lists: user_lists}
    else
        redirect '/'
    end
end