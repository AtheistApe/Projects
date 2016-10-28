import sys

from PySide.QtGui import QApplication, QMainWindow, QPushButton
from PySide.QtGui import QMessageBox

# Create the application object
app = QApplication(sys.argv)

# Create a simple dialog box
msgBox = QMessageBox()
msgBox.setText("Hello World - using Pyside version " + PySide.__version__)
msgBox.exec_()
