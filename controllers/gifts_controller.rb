put '/lists/:id/add-gift' do |id|
    if is_logged_in?
        list_id = params[:list_id]
        gift_title = params[:gift_title]
        gift_description = params[:gift_description]
        quantity = params[:quantity]
        size = params[:size]
        create_gift(list_id, gift_title, gift_description, quantity, size)
        results = all_gifts_in_list(list_id)
        list_details = list_details_by_id(list_id)
        erb :'lists/edit', locals: {results: results, list_details: list_details, list_id: list_id}
    else
        redirect '/'
    end
end

patch '/lists/:list_id/edit' do
    gift_id = params[:gift_id]
    gift_title = params[:gift_title]
    gift_description = params[:gift_description]
    quantity = params[:quantity]
    size = params[:size]
    list_id = params[:list_id]
    update_gift(gift_id, gift_title, gift_description, quantity, size)
    redirect '/lists/' + list_id
end

delete '/lists/:list_id/delete' do
    list_id = params[:list_id]
    gift_id = params[:gift_id]
    delete_gift(gift_id)
    redirect '/lists/' + list_id
end