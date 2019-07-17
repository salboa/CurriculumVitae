#!/usr/bin/python3

import os
import argparse
from os import listdir
from os.path import isfile, join
from os import walk

parser = argparse.ArgumentParser(description='Run spell check on tex files (by using aspell)')
parser.add_argument('--file'  , type=str, default=None, help='specify the tex file name: default -> search in folder')
parser.add_argument('--folder', type=str, default='.' , help='specify folder: default -> working folder'             )
parser.add_argument('--lang'  , type=str, default='en', help='specify language: default -> en'                       )
args = parser.parse_args()

def main():

    cmd   = "aspell --lang="+args.lang+" --mode=tex check "
    Files = GetListOfFiles("tex")
    for file in Files:
        print('spellChecker is running on file ',file)
        os.system(cmd+file)

def GetListOfFiles(extension):

    if args.file:
        return [args.file]
    else:
        for (dirpath, dirnames, filenames) in walk(args.folder):
            return (f for f in filenames if f.endswith('.'+extension))
                    
if __name__ == "__main__":
    main()
