require 'bcrypt'

def create_user(first_name, email, password)
    password_digest = BCrypt::Password.create(password)
    params = [first_name, email, password_digest]
    sql_query = "INSERT INTO users(first_name, email, password_digest) VALUES($1, $2, $3);"
    run_sql(sql_query, params)
end

def find_user_by_email( email )
    params = [email]
    sql_query = "SELECT * FROM users WHERE email = $1"
    results = run_sql(sql_query, params)
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end
end

def find_user_by_id( id )
    params = [id]
    sql_query = "SELECT * FROM users WHERE id = $1"
    results = run_sql(sql_query, params)
    if results.to_a.length > 0
        return results[0]
    else
        return nil
    end
end