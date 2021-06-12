post '/new_list' do
    list_title = params[:list_title]

    create_list(list_title)
    redirect '/lists'
end