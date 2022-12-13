from random import randint
from os.path import exists
import sys
def qsort(a, low, high):
    if(low >= high):
        return
    p = a[(low + high) // 2]       #srodkowy piviot
    i = low - 1
    j = high + 1
    while(1):
        while(1):               # while(a[++i] < p)
            i += 1
            if(a[i] >= p):
                break
        while(1):               # while(a[--j] < p)
            j -= 1
            if(a[j] <= p):
                break
        if(i >= j):
            break
        a[i],a[j] = a[j],a[i]
    qsort(a, low, j)
    qsort(a, j+1, high)

input = str(sys.argv[1])
file_number = ""
for it in input:
    if it.isdigit():
        file_number += it
    #pobieranie inputu
with open(f"input/{input}", "r") as f:
    lines = [int(line.rstrip()) for line in f]

qsort(lines, 0, len(lines)-1)
    #zapisywanie outputu
outputfile = open(f"output/output{file_number}.txt", "w")
for line in lines:
    outputfile.write(f"{str(line)}\n")
outputfile.close()

