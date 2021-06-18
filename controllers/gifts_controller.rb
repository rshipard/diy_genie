put '/list/:id/add-gift' do
    list_id = params[:list_id]
    gift_title = params[:gift_title]
    gift_description = params[:gift_description]
    quantity = params[:quantity]
    size = params[:size]
    create_gift()
    results = all_gifts_in_list(list_id)
    redirect '/lists/:list_id'
end