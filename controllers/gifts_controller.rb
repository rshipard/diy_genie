put '/lists/:id' do |id|
    list_id = params[:list_id]
    gift_title = params[:gift_title]
    gift_description = params[:gift_description]
    quantity = params[:quantity]
    size = params[:size]
    create_gift(list_id, gift_title, gift_description, quantity, size)
    results = all_gifts_in_list(list_id)
    redirect '/lists/:list_id'
end

patch '/lists/:list_id/edit/:gift_id' do
    gift_id = #{gift_id}
    update_gift(gift_id, gift_title, gift_description, quantity, size)
    redirect '/lists/:list_id'
end

delete '/lists/:list_id/delete/:gift_id' do
    gift_id = #{gift_id}
    delete_gift(gift_id)
    redirect '/lists/:list_id'
end