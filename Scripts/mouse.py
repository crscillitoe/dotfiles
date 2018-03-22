#!/usr/bin/env python3
import os

def main() :
    #We expect the file path to be input as the first argument
    os.system("xinput > temp.txt")
    words = readAllStrings("temp.txt")
    
    print(words)
    nextVal = False
    for w in words :
        if nextVal == True :
            mouseID = w.split("=")[1]
            os.system("sh /home/christian/git/dotfiles/Scripts/mouseID.sh 0.2 {}".format(mouseID))
            os.system("rm temp.txt")
            break
        if w == "Master" :
            nextVal = True

#This will return false for any non a-z, A-Z character.
def isLetter(char) :
    return char.isalpha()

#This will return true for any 'space' characters.
#List of spaceChars does not include '-' and " ' "
#because those can appear inside of words
def isSpace(char) :
    spaceChars = [' ', '\n', '	', ',', '!', '?', '.']
    return char in spaceChars

#This will return false for any string != ""
def isNotEmpty(string) :
    return string != ""

#Returns an array of words read from a given file.
def readAllStrings(filePath) :
    f = open(filePath, "r")
    lines = f.readlines()

    #We'll store all of our words here
    toReturn = []

    #Read all strings from the given file into the array.
    toAdd = ""
    for line in lines :
        for char in line :
            if isSpace(char) :
                if isNotEmpty(toAdd) :
                    toReturn.append(toAdd)
                    toAdd = ""
            else :
                toAdd += char
    f.close()
    return toReturn

#Returns a number equal to the most occurencies of any letter in 'word'
#Examples :
# Frisbee : 2
# Mmmm    : 4
# giant   : 1
def getMaxNumOfLetters(word) :
    letterNumbers = [0 for i in range(26)]
    allLowerCase = word.lower()
    for c in allLowerCase :
        if isLetter(c) :
            letterNumbers[ord(c) - ord('a')] += 1
    return max(letterNumbers)

#Returns the index of the largest value in a given int array
#Examples :
#[0, 5, 3]: 1
#[5, 0, 3]: 0
#[0, 3, 5]: 2
def getLargestIndex(intArray) :
    maxValFound = -1
    indexToReturn = -1
    counter = 0
    for val in intArray :
        if val > maxValFound :
            maxValFound = val
            indexToReturn = counter
        counter += 1
    return indexToReturn


if __name__ == "__main__" :
    main()

