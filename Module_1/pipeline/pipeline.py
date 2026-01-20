import sys
import pandas as pd

print("Arguments passed to the script:", sys.argv)
# the first argument is the script name
# that is why we access sys.argv[1]
month = int(sys.argv[1])
df = pd.DataFrame({"A": [1, 2], "B": [3, 4]})
print(df.head())
print(f"month {month}")

df.to_parquet(f"output_{month}.parquet")