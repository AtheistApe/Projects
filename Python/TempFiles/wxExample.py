# -*- coding: utf-8 -*-
"""
Created on Wed Mar 30 16:36:04 2016

@author: gary
"""

import wx

app = wx.App(False)  # Create a new app, don't redirect stdout/stderr to a window.

frame = wx.Frame(None, wx.ID_ANY, "Hello World") # A Frame is a top-level window.
frame.Show(True)     # Show the frame.

app.MainLoop()