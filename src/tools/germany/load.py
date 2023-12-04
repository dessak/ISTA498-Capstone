"""
__author__ = "Nate Cutler"
__credits__ = ["Data sourced from Bundesamt fur Strahlenschutz"]
__maintainer__ = "Nate Cutler"
__email__ = "ncutler211@gmail.com"
"""

# Required libraries
import pandas as pd
import psycopg2
from sqlalchemy import create_engine

# Function to test database connection
def test_conn():
    try:
        # Establish a connection to the database
        conn = psycopg2.connect(
            host="XXXX",
            database="XXXX",
            user="XXXX",
            password="XXXX",
            port='XXXX'
        )

        # Create a cursor
        cur = conn.cursor()

        # Execute a test query
        cur.execute("SELECT version();")

        # Fetch and print the result
        db_version = cur.fetchone()
        print("PostgreSQL database version:")
        print(db_version)

    except psycopg2.Error as e:
        print("Error connecting to the database:", e)

    finally:
        # Close cursor and connection
        if conn:
            cur.close()
            conn.close()

# Function to get connection and cursor
def get_conn_cur(host, database, user, password):
    conn = psycopg2.connect(
        host=host,
        database=database,
        user=user,
        password=password,
        port='5432'
    )
    cur = conn.cursor()
    return conn, cur

# Function to get table names from the database
def get_table_names(host, database, user, password):
    conn, cur = get_conn_cur(host, database, user, password)

    table_name_query = """SELECT table_name FROM information_schema.tables
       WHERE table_schema = 'public' """

    cur.execute(table_name_query)
    my_data = cur.fetchall()

    cur.close()
    conn.close()

    return my_data

# Function to get column names of a specified table
def get_column_names(host, database, user, password, table_name):
    conn, cur = get_conn_cur(host, database, user, password)

    column_name_query = f"""SELECT column_name FROM information_schema.columns
       WHERE table_name = '{table_name}' """

    cur.execute(column_name_query)
    my_data = cur.fetchall()

    cur.close()
    conn.close()

    return my_data

# Function to execute a SQL query and return results
def run_query(host, database, user, password, query_string):
    conn, cur = get_conn_cur(host, database, user, password)

    cur.execute(query_string)
    my_data = cur.fetchall()

    colnames = [desc[0] for desc in cur.description]

    cur.close()
    conn.close()

    return colnames, my_data

# Function to create a table in the database
def create_table(host, database, user, password, table_name, table_definition):
    try:
        conn = psycopg2.connect(
            host=host,
            database=database,
            user=user,
            password=password
        )
        cur = conn.cursor()

        create_table_query = f"CREATE TABLE {table_name} {table_definition}"

        cur.execute(create_table_query)
        conn.commit()

        print(f"Table {table_name} created successfully.")

    except (Exception, psycopg2.Error) as error:
        print(f"Error: {error}")

    finally:
        if conn:
            cur.close()
            conn.close()

# Function to drop a table from the database
def drop_table(table_name, database_uri):
    engine = create_engine(database_uri)
    connection = engine.connect()
    connection.execute(f"DROP TABLE IF EXISTS {table_name}")
    connection.close()

# Function to fetch data from a specified table
def sql_head(table_name, host, database, user, password):
    conn, cur = get_conn_cur(host, database, user, password)
    sales_df = pd.read_sql(f"SELECT * FROM {table_name} LIMIT 5;", conn)
    return sales_df

# Main function
def main():
    # Database connection details
    host = "XXXX"
    database = "XXXX"
    user = "XXXX"
    password = "XXXX"

    # Create Germany table
    table_name = "germany"
    table_def = "(start_date TIMESTAMP, end_date TIMESTAMP, reading FLOAT, unit VARCHAR(12), city VARCHAR(255), state VARCHAR(30), cid VARCHAR(3), lat INT, long INT, comment VARCHAR(255))"
    create_table(host, database, user, password, table_name, table_def)

    # Pandas DataFrame to SQL table & Upload
    database_uri = "XXXX"
    engine = create_engine(database_uri)
    tn = "germany"
    # 'transformed_data' is undefined in this context, please define it before using it
    transformed_data_subset = transformed_data.head(10)  # Limit to the first 10 rows
    transformed_data_subset.to_sql(tn, engine, if_exists='replace', index=False)

# Entry point
if __name__ == "__main__":
    main()





