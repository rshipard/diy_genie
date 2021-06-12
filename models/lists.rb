def create_list(list_title, list_owner)
    params = [list_title, list_owner]
    sql_query = "INSERT INTO lists(list_title, list_owner) VALUES($1, $2);"
    run_sql(sql_query, params)
end