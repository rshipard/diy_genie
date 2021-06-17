def all_friends_for_user()
    params = [session[:user_id]]
    sql_query = "SELECT * FROM friends WHERE user_id = $1"
    results = run_sql(sql_query, params)
end

def create_friend()
    friends_email = params[:friends_email]
    user_id = session[:user_id]
    params = [user_id, friends_email]
    sql_query = "INSERT INTO friends (user_id, friends_email) VALUES ($1, $2);"
    results = run_sql(sql_query, params)
end

def remove_friend(friends_email)
    user_id = session[:user_id]
    params = [user_id, friends_email]
    sql_query = "DELETE FROM friends WHERE user_id = $1 AND friends_email = $2;"
    results = run_sql(sql_query, params)
end
