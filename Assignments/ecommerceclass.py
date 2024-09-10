import pandas as pd

class ECommerceData:
    def __init__(self, file_path):
        self.df = pd.read_excel(file_path)
        self.preprocess_data()
        print(self.df)
    def preprocess_data(self):
        self.df.fillna(method='ffill', inplace=True)
        self.df['Product ID']= self.df['Product ID'].astype(int)
        self.df['Customer ID']= self.df['Customer ID'].astype(int)
        self.df['Quantity Sold']= self.df['Quantity Sold'].astype(int)
        self.df['Product Category'] = self.df['Product Category'].str.lower().str.strip()
        self.df['Product Subcategory'] = self.df['Product Subcategory'].str.lower().str.strip()
        self.df['Total Sales'] = self.df['Product Price'] * self.df['Quantity Sold']
        self.df['Transaction Month'] = self.df['Transaction Date'].dt.month
       
    def get_best_selling_products(self, top_n=5):
        return self.df.groupby('Product ID')['Total Sales'].sum().nlargest(top_n).reset_index()

    def get_least_selling_products(self, top_n=5):
        return self.df.groupby('Product ID')['Total Sales'].sum().nsmallest(top_n).reset_index()

# Example usage
ecommerce_data = ECommerceData('sample_ecommerce_data_na.xlsx')
print(ecommerce_data.get_best_selling_products())
print(ecommerce_data.get_least_selling_products())