import numpy as np
import pandas as pd

# long form data set
ds_long = pd.melt(ds, id_vars = ['species'], value = "sepal_width", "sepal_length", "petal_width", "petal_length")

# group_by on long form
mult_indx = ds_long.groupby(["species", "vars"]).mean()

# pandas pivot
pd.pivot_table(ds_long, values = "vals", index = ["vars"], columns = ["species"], aggfunc = np.mean)

# functions
def number_adder(a, b):
    # purpose: add 2 numbers and return the sum
    # parameters: a = numeric, b = numeric
    # output: numeric sum of a and b
    out = a + b
    return(out)

# running number adder
number_adder(a = 3, b = 6)

# more complex function
def number_adder_two(a = None, b = None):
    if a == None or b == None:
        out = "please provide inputs for a and b or type numeric"
    else: 
        out = a + b
    return(out)

number_adder_two(a = 6)
number_adder_two(a = 6, b = 4)

# graphics - seaborn
# import seaborn
import seaborn as sns
import matplotlib.pyplot as plt

ds = sns.load_dataset('iris')

print(ds.head())

sns.pairplot(ds, hue='species')
plt.show() 

import seaborn as sns 
sns.set_theme(style = "ticks", font_scale = 1.5)

sns.s 

f = sns.relplot(
    data = ds,
    x = "sepal_width", y = "petal_length",
    style = "species", hue = "species"
)

f.set_axis_labels("sepal width", "petal length", labelpad = 10)
f.legend.set_title("species")

sns.set_theme(style = "white", font_scale = 1.5)

sns.move_legend(
    f, "upper center",
    bbox_to_anchor = (0.5, 1), ncol = 3, title = None, frameon = False
)

sns.catplot(data = ds_long, kind = "bar", x = "species", y = "vals", hue = "vars")

