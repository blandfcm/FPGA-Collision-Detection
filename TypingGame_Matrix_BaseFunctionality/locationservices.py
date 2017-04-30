#!/usr/bin/python
import numpy
#from wordcontroller import getUpper
#from wordcontroller import chartopix

#alphU = getUpper()

def overlayAt(x, y, overlay, underlay, stamp):
    #stamp = 1 means overlay pix doesn't
    screen = numpy.zeros((len(underlay[0]), len(underlay)))
    dispDim = [0, 0]
    dRow = len(overlay)
    dCol = len(overlay[0])
    # dispDim = disp.shape()
    if (x < 0 or x > 31 or y < 0 or y > 31):
        return screen
    if(stamp):
        for j in range(0, dCol):
            for i in range(0, dRow):
                if overlay[i][j] == 1 or underlay[i+x][j+y] == 1:
                    #screen[i+x][j+y] = 1
                    underlay[i + x][j + y] = 1
                else:
                    #screen[i+x][j+y] = 0
                    underlay[i + x][j + y] = 0
        return underlay
        #return screen
    else:
        for j in range(0, dCol):
            for i in range(0, dRow):
#                print(i + x)
#                print(j + y)
#                print("---------")
                if overlay[i][j] == 1:
                    #screen[i + x][j + y] = 1
                    underlay[i+x][j+y] = 1
                else:
                    #screen[i + x][j + y] = 0
                    underlay[i+x][j+y] = 0
        return underlay
        #return screen


def displayAt(x, y, disp):
    screen = numpy.zeros((32, 32))
    dispDim = [0, 0]
    dRow = len(disp)
    dCol = len(disp[0])
    #dispDim = disp.shape()
    if (x < 0 or x > 31 or y < 0 or y > 31):
         return screen

    #for i in range(0, dCol):
    #for j in range(0, dRow):
    #screen[i+x][j+y] = 
    for j in range(0, dCol):
        for i in range(0, dRow):
            screen[i+x][j+y] = disp[i][j]
    return screen
