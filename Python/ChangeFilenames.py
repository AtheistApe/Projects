import os

def rename_files():
    #(1) get file names from a folder
    file_list = os.listdir(r"/Users/gary")
    for file in file_list:
        print(file)

    #(2) for each file, rename file

rename_files()