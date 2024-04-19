import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Assuming your data is in a CSV file named 'data.csv'
data = pd.read_csv('Supermarket_products.csv')

plt.figure(figsize=(10, 6))
sns.scatterplot(x='sale_price', y='market_price', data=data, hue='category', palette='Set1')
plt.title('Sale Price vs Market Price')
plt.xlabel('Sale Price')
plt.ylabel('Market Price')
plt.tight_layout()
plt.show()
