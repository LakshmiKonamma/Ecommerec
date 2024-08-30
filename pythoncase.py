import pandas as pd
df = pd.read_excel('sample_ecommerce_data_na.xlsx')
print(df)
print("*"*80)
print(df.isnull().sum()) # checking missing values
# df.fillna(method="ffill",inplace=True) # replacing null values with forward fill
df.dropna(inplace=True) # deleting null values

print("*"*80)
# print(df)
print("*"*80)
print(df.info()) # to get data types of columns
# changing data types
df['Product ID']= df['Product ID'].astype(int)
df['Customer ID']= df['Customer ID'].astype(int)
df['Quantity Sold']= df['Quantity Sold'].astype(int)
print("*"*80)
print(df.info())
print("*"*80)
print(df)
df['Product Category']=df['Product Category'].str.lower().str.strip()
df['Product Subcategory']=df['Product Subcategory'].str.lower().str.strip()

print(df.info())
df['Total Sales']=df['Product Price'] * df['Quantity Sold']
df['Transaction Month']=df['Transaction Date'].dt.month
print(df)
print("*"*80)

df.to_excel('cleandata.xlsx',index=False)
category_sales=df.groupby('Product Category')['Total Sales'].sum().reset_index()
print("*"*80)
print(category_sales)
max_category_sales=df.groupby('Product Category')['Total Sales'].sum().nlargest(1)
print("*"*80)
print("max_category_sale:\n","-"*60,"\n",max_category_sales)
sub_category_sales=df.groupby('Product Subcategory')['Total Sales'].sum().reset_index()
print("*"*80)
print(sub_category_sales)
max_sub_category_sales=df.groupby('Product Subcategory')['Total Sales'].sum().nlargest(1)
print("*"*80)
print("max_sub_category_sales:\n","-"*60,"\n",max_sub_category_sales)
best_max_category_sales=df.groupby('Product ID')['Total Sales'].sum().nlargest(5)
print("*"*80)
print("Best_max_category_sale:\n","-"*60,"\n",best_max_category_sales)
print("*"*80)
print("max_sub_category_sales:\n","-"*60,"\n",max_sub_category_sales)
least_max_category_sales=df.groupby('Product ID')['Total Sales'].sum().nsmallest(5)
print("*"*80)
print("Least_max_category_sale:\n","-"*60,"\n",least_max_category_sales)

Profit = df.groupby('Product ID')['Quantity Sold'].sum().nlargest(5)
print("most profitable products::",Profit)
print("*"*80)
analysis_loc_pay=df.groupby(['Customer Location','Payment Method']).agg({'Payment Method':'count'})
print("*"*80)
print("analysis_loc_pay",analysis_loc_pay)


