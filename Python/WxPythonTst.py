#!/usr/local/bin/python
# -*- coding: iso-8859-1 -*-

try:
    import wx
except ImportError:
    raise ImportError, "The wxPython module is required to run this program"


class simpleapp_wx(wx.Frame):

    """A simple wxPython app"""

    def __init__(self, parent, id, title):
        wx.Frame.__init__(self, parent, id, title)
        self.parent = parent
        self.initialize()

    def initialize(self):
        self.Show(True)

if __name__ == '__main__':
    app = wx.App()
    frame = simpleapp_wx(None, -1, "Gary's application")
    app.MainLoop()
