def all_gifts_in_list(list_id)
    params = [list_id]
    sql_query = "SELECT * FROM gifts WHERE list_id = $1;"
    run_sql(sql_query, params)
end

def create_gift(list_id, gift_title, gift_description, quantity, size)
    params = [list_id, gift_title, gift_description, quantity, size]
    sql_query = "INSERT INTO gifts(list_id, gift_title, gift_description, quantity, size) VALUES($1, $2, $3, $4, $5);"
    run_sql(sql_query, params)
end

def delete_gift(gift_id)
    params = [gift_id]
    sql_query = "DELETE FROM gifts WHERE id = $1;"
    results = run_sql(sql_query, params)
end

def update_gift(gift_id, gift_title, gift_description, quantity, size)
    params = [gift_id, gift_title, gift_description, quantity, size]
    sql_query = "UPDATE gifts SET gift_title = $2, gift_desription = $3, quantity = $4, size = $5 WHERE id = $1;"
    results = run_sql(sql_query, params)
end