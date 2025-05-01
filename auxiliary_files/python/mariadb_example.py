import mariadb
import sys


# Print List of Contacts
def print_contacts(cur):
    """Retrieves movie sales from the database and prints to stdout"""

    # Initialize Variables
    sales = []

    # Retrieve Contacts
    cur.execute("SELECT c.name AS category, SUM(p.amount) AS total_sales FROM payment AS p INNER JOIN rental AS r ON p.rental_id = r.rental_id INNER JOIN inventory AS i ON r.inventory_id = i.inventory_id INNER JOIN film AS f ON i.film_id = f.film_id INNER JOIN film_category AS fc ON f.film_id = fc.film_id INNER JOIN category AS c ON fc.category_id = c.category_id GROUP BY c.name ORDER BY total_sales DESC;")

    # Prepare Contacts
    for (category, total_sales) in cur:
        sales.append(f"{category}: {total_sales}$")

    # List Contacts
    print("\n".join(sales))


if __name__ == '__main__':
    try:
        conn = mariadb.connect(
            host="127.0.0.1",
            database="sakila",
            user="python",
            password="python")

        # Instantiate Cursor
        cur = conn.cursor()

        print_contacts(cur)

        # Close Connection
        conn.close()
    except mariadb.Error as e:
        print(f"Error connecting to the database: {e}")
        sys.exit(1)
