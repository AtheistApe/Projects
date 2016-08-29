import os

processingPath = "/Users/gary/Documents/Processing/"

def createDirStructure(fileName):
    fileDir = processingPath + fileName
    filePath = fileDir + "/" + fileName + ".pde"

    if not os.path.exists(fileDir):
        os.makedirs(fileDir)
    else:
        pass

    if not os.path.exists(filePath):
        target = open(filePath, 'w')
        target.close()
    else:
        pass

createDirStructure('tempDir')
