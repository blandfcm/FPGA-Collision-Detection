#!/usr/bin/python
from locationservices import *
from wordcontroller import *
from matrix_printer import *
import numpy
import sys

# Max length of input = 6 char

def main(arg1, arg2):
    #   INPUT
    word = arg1
    score = arg2
    #   end INPUT

    # Initialize canvas
    canvas_pix = numpy.zeros((32, 32))

    # Word input -> canvas
    canvas_pix = overlayAt(1, 4, stringtopix(word), canvas_pix, 1)

    # Scoreboard -> canvas
    canvas_pix = overlayAt(1, 16, stringtopix("Score:"), canvas_pix, 1)

    # Score input -> canvas
    canvas_pix = overlayAt(1, 24, stringtopix(str(score)), canvas_pix, 1)

    print_to_matrix_default(canvas_pix)


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])


