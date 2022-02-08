from itertools import combinations, permutations

name = ['e','n','o','l','a']

for i in range(1,len(name)+1):
    print(list(combinations(name,i)))

# permuations

# enola 
name = ['e','n','o','l','a']

for new_perm in permutations(name):
    print("".join(new_perm))
