import pandas as pd
from collections import Counter

# Read data from Excel file
excel_file = "D:/dataset_ds.xlsx"  # Path to your Excel file
df = pd.read_excel(excel_file)

# Combine all item columns into a new column 'items bought'
df['items_bought'] = df[['Last_Month', 'Second_Last_Month', 'Third_Last_Month', 'Fourth_Last_Month']].apply(lambda x: ','.join(x.dropna()), axis=1)

# Function to count the occurrences of each item in the 'items bought' column
def count_items(items):
    # Split the concatenated string into individual items
    all_items = items.split(',')

    # Count the occurrences of each item
    item_counts = Counter(all_items)

    # Sort the item counts in descending order based on count
    sorted_item_counts = dict(sorted(item_counts.items(), key=lambda x: x[1], reverse=True))

    return sorted_item_counts

# Apply the function to count item occurrences for each row
df['sorted_item_counts'] = df['items_bought'].apply(count_items)

# Function to print the top 3 items for a given customer ID
def print_top_items(cust_id):
    row = df[df['Cust_id'] == cust_id]
    if row.empty:
        print(f"Customer ID {cust_id} doesn't exist.")
        return
    sorted_item_counts = row.iloc[0]['sorted_item_counts']
    top_items = list(sorted_item_counts.items())[:3]
    print(f"Top 3 items for customer ID {cust_id}:")
    for item, count in top_items:
        print(f"- {item} (count: {count})")
    print()

# Final input system
while True:
    try:
        cust_id = int(input("Enter the customer ID (or 0 to exit): "))
        if cust_id == 0:
            break
        print_top_items(cust_id)
    except ValueError:
        print("Please enter a valid customer ID (an integer).")

print("Exiting the program.")
