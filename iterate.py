def read_large_file(file_path):
    with open(file_path, 'r') as file:
        for line in file:
            yield line

# Example usage
for line in read_large_file('cleandatacsv.csv'):
    print(line)
