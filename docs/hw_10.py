# homework 10 frania darringer

my_list = [33, "oogabooga", True, [10, 20, 30, 40], 3.33]

third_element = my_list[2]
print(third_element)

interior_list = my_list[3]
list_within_list = interior_list[2]
print(list_within_list)

my_list.append("new item")
print(my_list)

my_list.pop(1)
print(my_list)

my_dict = {
    "name": "frania",
    "fruit": "mango",
    "# of cats": 3,
    "gpa": 3.27,
    "likes_bikes": True
}

print(my_dict.keys)
print(my_dict.values)

my_dict.update({"minor": "spanish"})

my_dict.pop("fruit")

print(my_dict)

my_dict["favorite_tree"] = "sugar maple"

del my_dict["gpa"]

print(my_dict)

import numpy as np  # noqa: E402 # idk python just put that there

arr1 = np.random.rand(100)

last_10 = arr1[-10:]
print(last_10)

arr_str = arr1.astype(str)
arr_float_again = arr_str.astype(float)

arr2D = arr1.reshape(10, 10)
print(arr2D.shape)

arr_bin = np.random.choice([0, 1], size=(10, 10), p=[0.8, 0.2])
print(arr_bin)

arr_3D = np.stack((arr2D, arr_bin), axis=2)
print(arr_3D.shape)
