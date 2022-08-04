#key = "a"
#dictionary = {"a": {"b": {"c": "d"}}}
key = "z"
dictionary = {"x": {"y": {"z": "a"}}}
flag = 0
def recursive_call(dictionary,key,flag):
    for k, v in dictionary.items():
        if k == key:
            flag = 1
        if type(v) is dict:
            yield from recursive_call(v,key,flag)
        else:
            if flag != 0:
                yield (k, v)

for k, v in recursive_call(dictionary,key,flag):
    print(v)
