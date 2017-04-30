#!/usr/bin/python
import numpy

def print_to_matrix_default(thing):
    dRow = len(thing)
    dCol = len(thing[0])
    for y in range(0, dCol):
        for x in range(0, dRow):
            print(int(thing[x][y])),
        print('\n')