
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# Read data from Excel file
excel_file = "D:/dataset_ds.xlsx"  # Path to your Excel file
df = pd.read_excel(excel_file)

# Combine all item columns into a new column 'items_bought'
df['items_bought'] = df[['Last_Month', 'Second_Last_Month', 'Third_Last_Month', 'Fourth_Last_Month']].apply(lambda x: ','.join(x.dropna()), axis=1)

# Convert items_bought into numerical format using TF-IDF vectorization
tfidf_vectorizer = TfidfVectorizer(stop_words='english', tokenizer=lambda x: x.split(','), token_pattern=None)
tfidf_matrix = tfidf_vectorizer.fit_transform(df['items_bought'])

# Apply KMeans clustering
k = 10  # Number of clusters
kmeans = KMeans(n_clusters=k, random_state=42)
kmeans.fit(tfidf_matrix)

# Assign cluster labels to the dataframe
df['cluster'] = kmeans.labels_

# Analyze the clusters
cluster_counts = df['cluster'].value_counts().sort_index()

# Get the most common items in each cluster
cluster_items = {}
for cluster_id in range(k):
    cluster_items[cluster_id] = df[df['cluster'] == cluster_id]['items_bought'].str.split(',').explode().value_counts().idxmax()

# Plot the cluster sizes with item names
plt.figure(figsize=(10, 6))
plt.bar([cluster_items[cluster_id] for cluster_id in range(k)], cluster_counts.values)
plt.xlabel('Items Bought')
plt.ylabel('Number of Customers')
plt.title('Distribution of Customers Across Items Clusters')
plt.xticks(rotation=45, ha='right')  # Rotate x-axis labels for better readability
plt.tight_layout()
plt.show()
