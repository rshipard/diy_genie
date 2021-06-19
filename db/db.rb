def run_sql(sql_query, params = [])
    connection = PG.connect(ENV['DATABASE_URL'] || {dbname: 'diy_genie'})
    connection.prepare("sql", sql_query)
    results = connection.exec_prepared("sql", params)
    connection.close
    return results
end