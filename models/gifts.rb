def create_gift()
    params = [list_id, gift_title, gift_description, quantity, size]
    sql_query = "INSERT INTO gifts(list_id, gift_title, gift_description, quantity, size) VALUES($1, $2, $3, $4, $5);"
    run_sql(sql_query, params)
end

def all_gifts_in_list()
    params = [:list_id]
    sql_query = "SELECT * FROM gifts WHERE list_id = $1;"
    run_sql(sql_query, params)
end