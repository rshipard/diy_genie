def create_list(list_title, list_owner)
    params = [list_title, list_owner]
    sql_query = "INSERT INTO lists(list_title, list_owner) VALUES($1, $2);"
    run_sql(sql_query, params)
end

def all_user_lists()
    user_id = session[:user_id]
    params = [user_id]
    sql_query = "SELECT * FROM lists WHERE list_owner = $1;"
    run_sql(sql_query, params)
end

def list_details_by_id(list_id)
    params = [list_id]
    sql_query = "SELECT * FROM lists WHERE id = $1;"
    results = run_sql(sql_query, params)
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end
end

def all_gifts_in_list()
    params = [:list_id]
    sql_query = "SELECT * FROM gifts WHERE list_id = $1;"
    results = run_sql(sql_query, params)
end

def rename_list(list_id, list_title)
    params = [list_id, list_title]
    sql_query = "UPDATE lists SET list_title = $2 WHERE id = $1;"
    results = run_sql(sql_query, params)
end

def find_list_by_owner_id(owner_id)
    params = [owner_id]
    sql_query = "SELECT * FROM lists WHERE list_owner = $1;"
    results = run_sql(sql_query, params)
end
