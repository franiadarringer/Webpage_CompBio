# march 19

# mixed lists
mixed = [1, 3, True, "blue", 5]

mixed.pop()
mixed.append("green")
mixed.remove("start")

last = mixed.pop()

# list comprehension
# like a for.loop that takes place in one line

print(mixed)

[x for x in mixed]
[x for x in mixed if isinstance(x,str)]

# dictionaries
md = {
    "first": "john",
    "last": "smith",
    "year": 2017,
    "status": "active"
}

md2 = dict(first = "john", last = "smith")

type(md) # tells you what type it is
len(md) # length of dictionary

dataTypes = {
    "string": "thing",
    "integer": 3,
    "float": 3.14342,
    "list": [1, 2, 3, "a"],
    "boolean": False
}

dataTypes["string"]
dataTypes.get["boolean"]

# return as list of tuples
dataTypes.items()

dataTypes["age"] = 36

# numpy
import numpy as np  # noqa: E402

arr1 = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
arr1[3]
arr1[-1]
arr1[:3]
arr1[1:5]

# 3/24
random = arr1
x = random.normal(loc=5, scale=3, size=20)

x = random.binomial(n=10, p=0.5, size=30)

random.uniform(low=1, high=10, size=50)

# logic structures
# if statements
a = 3
if a  >= 5:
    print("a is greater than or equal to 5")

a=3
b=3
operation = "exp"

if operation == "mult":
    y = a * b
elif operation == "div":
    y = a/b
elif operation == "add":
    y = a + b
elif operation == "sub":
    y = a - b
else:
    y = "i dont know that operation"

# loops
for i in range(2):
    print(i)

# pandas data frames

import pandas as pd  # noqa: E402

dates = pd.date_range("20130101", periods = 6)
df = pd.DataFrame(np.random.randn(6,4), index = dates, columns = list("ABCD"))
df

df.head(4)
df.tail(4)
df.index # pulls the row index names
df.columns # col names
df.describe() # summary statistics of each column
df.to_numpy() # numpy conversion

# indexing into pandas
df["A"]
df.loc[:, ["A", "B"]]
df["insert two dates"]

# read in csv file
ds = pd.read_csv("iris.data.csv")
ds.head

# fully numeric filter
df[df>0.5]
