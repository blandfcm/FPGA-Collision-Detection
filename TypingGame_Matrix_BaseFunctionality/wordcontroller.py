#!/usr/bin/python
import numpy, string
from locationservices import *

alph = "abcdefghijklmnopqrstuvwxyz"
special_char = "!q#$%&'()*+,-./:;<=>?(|)ab"

def specialtopix(special):
    if special == 'quote':
        special = "q"
    elif special == 'arrow_right':
        special = "a"
    elif special == 'arrow_left':
        special = "b"
    pix_char = numpy.zeros((5, 7))
    special_pix = getSpecialCharacters()
    specialIdx = special_char.find(special)
    if specialIdx < 0:
        pix_char[0][0] = 1
        return pix_char
    if specialIdx > 25:
        pix_char[0][3] = 1
        return pix_char
    for j in range(0, 7):
        for i in range(0, 5):
            pix_char[i][j] = special_pix[specialIdx][i][j]
    return pix_char

def stringtopix(text):
    textlen = len(text)
    pix_word = numpy.zeros((textlen * 5, 7))
    if len(text) > 6:
        print('stringtopix->text @param too big')
        return pix_word

    alphU = getUpper()
    alphL = getLower()
    alphS = getSpecialCharacters()
    alphN = getNumbers()

    pixIdx = 0
    for i in range(0, textlen):
        if len(set(string.ascii_lowercase).intersection(text[i])) > 0:
            idx = alph.index(text[i].lower())
            pix_word = overlayAt(i * 5, 0, alphL[idx][:][:], pix_word, 1)
        elif len(set(string.ascii_uppercase).intersection(text[i])) > 0:
            idx = alph.index(text[i].lower())
            pix_word = overlayAt(i*5,0, alphU[idx][:][:],pix_word,1)
        elif len(set(string.punctuation).intersection(text[i])) > 0:
            pix_word = overlayAt(i * 5, 0, specialtopix(text[i]), pix_word, 1)
        elif len(set(string.digits).intersection(text[i])) > 0:
            idx = string.digits.index(text[i])
            pix_word = overlayAt(i * 5, 0, alphN[idx][:][:], pix_word, 1)
        else:
            #space in string ? -sure, might work
            pix_word = overlayAt(i * 5, 0, numpy.zeros((5,7)), pix_word, 1)
#        for y in range(0, 7):
#            pix_word[pixIdx:pixIdx+4][y] = alphU[idx*5:(idx*5)+4][y]
#            pixIdx = pixIdx + 5
    return pix_word

def chartopix(letter):
    pix_char = numpy.zeros((5, 7))
    alphU = getUpper()
    alphIdx = alph.find(letter.lower())
    if alphIdx < 0:
        pix_char[0][0] = 1
        return pix_char
    if alphIdx > 25:
        pix_char[0][3] = 1
        return pix_char
    for j in range(0, 7):
        for i in range(0, 5):
            pix_char[i][j] = alphU[alphIdx][i][j]
    return pix_char

def getUpper():
    upper = numpy.zeros((26, 5, 7))

    lines = [line.rstrip('\n') for line in open('upper-letters.txt')]
    lcount = 0
    for i in range(0, 26):
        for k in range(0, 7):
            for j in range(0, 5):
                upper[i][j][k] = lines[lcount][j]
            lcount = lcount + 1
    return upper

def getLower():
    lower = numpy.zeros((26, 5, 7))

    lines = [line.rstrip('\n') for line in open('lower_case.txt')]
    lcount = 0
    for i in range(0, 26):
        for k in range(0, 7):
            for j in range(0, 5):
                lower[i][j][k] = lines[lcount][j]
            lcount = lcount + 1
    return lower

def getSpecialCharacters():
    special = numpy.zeros((26, 5, 7))

    lines = [line.rstrip('\n') for line in open('special_characters.txt')]
    lcount = 0
    for i in range(0, 26):
        for k in range(0, 7):
            for j in range(0, 5):
                special[i][j][k] = lines[lcount][j]
            lcount = lcount + 1
    return special

def getNumbers():
    number = numpy.zeros((10, 5, 7))

    lines = [line.rstrip('\n') for line in open('numbers.txt')]
    lcount = 0
    for i in range(0, 10):
        for k in range(0, 7):
            for j in range(0, 5):
                number[i][j][k] = lines[lcount][j]
            lcount = lcount + 1
    return number