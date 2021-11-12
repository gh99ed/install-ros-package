f = open("input.txt","w")
f.write("7 15\n2 5\n3 2\n4 6\n8 7\n7 7\n6 5\n5 2\n")
f.close()
# take inputs
f = open('input.txt')
N, K = list(map(int, f.readline().strip().split(' ')))
content = f.read().split('\n')
f.close()
print(N, K)
items = []
i = 1
for each in content:
 if each == '':
 break
 line = each.strip().split(' ')
 p, q = list(map(int, line))
 items.append([i, p, q])
 i += 1
# Exercise-2: pick most expensive items first
# use a copy of items for later use
items_copy = [x for x in items]
items_copy = sorted(items_copy, key=lambda x: x[2], reverse=True)
capacity_remaining = K
total_value = 0
i = 0
while True:
 if items_copy[i][1] <= capacity_remaining:
 total_value += items_copy[i][2]
 capacity_remaining -= items_copy[i][1]
 else:
 break
 i += 1
output_line = ['0']*N
j = 0
while j < i:
 output_line[items_copy[j][0]-1] = '1'
 j += 1
f = open("output.txt","w")
f.write(str(K-capacity_remaining) + ' ' + str(total_value) + '\n')
f.write("".join(output_line))
f.close()
# Exercise-3: least heavy items first
# use a copy of items for later use
items_copy = [x for x in items]
items_copy = sorted(items_copy, key=lambda x: x[1], reverse=False)
capacity_remaining = K
total_value = 0
i = 0
while True:
 if items_copy[i][1] <= capacity_remaining:
 total_value += items_copy[i][2]
 capacity_remaining -= items_copy[i][1]
 else:
 break
 i += 1
print(items_copy)
output_line = ['0']*N
j = 0
while j < i:
 output_line[items_copy[j][0]-1] = '1'
 j += 1
f = open("output.txt","w")
f.write(str(K-capacity_remaining) + ' ' + str(total_value) + '\n')
f.write("".join(output_line))
f.close()
