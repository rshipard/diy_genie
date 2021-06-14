def create_list(list_title, list_owner)

    params = [list_title, list_owner]
    sql_query = "INSERT INTO lists(list_title, list_owner) VALUES($1, $2);"
    run_sql(sql_query, params)
end

def make_list_transparent(transparent_list)
    # make a SQL query that OVERRIDES the list transparency with true for the current user list, by list id
end

def all_user_lists()
    user_id = session[:user_id]
    params = [user_id]
    sql_query = "SELECT * FROM lists WHERE list_owner = $1;"
    run_sql(sql_query, params)
end